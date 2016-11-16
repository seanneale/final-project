class MatchWorker
	include Sidekiq::Worker

	def perform
		active_rounds = Round.where(active: true)
		# for each active round
		active_rounds.each do |round|
			# check each unplayed game and see if it can be played 
			ready_matches = round.matches.where(played: false, home_team_picked: true, away_team_picked: true)
			ready_matches.each do |match|
				puts match[:id]
				# play the ready games
				play_match match[:id]
				# set them to played
				Match.find(match[:id]).update(played: true)
			end

		end

	end

	def play_match id

		home_team_id = Match.find(id)[:home_team_id]
		away_team_id = Match.find(id)[:away_team_id]
		# getting the teams and defining the squad
		home_team_squad = build_match_squad id,home_team_id
		away_team_squad = build_match_squad id,away_team_id
		@home_team_name = SourceTeam.find(home_team_id)[:name]
		@away_team_name = SourceTeam.find(away_team_id)[:name]
		
		Match.find(id).update(home_team_score: 0)
		Match.find(id).update(away_team_score: 0)

		@clock = 0
		Match.find(id).update(control: true)
		Match.find(id).update(possesion_zone: 4)
		Match.find(id).match_events.create(time: clock, event_type: 1, event_text: @home_team_name + ' are kicking off', team_id: Match.find(id)[:home_team_id], zone: Match.find(id)[:possesion_zone])
		while @clock < 91 do
			# puts clock
			# puts Match.find(id)[:possesion_zone]
			# puts Match.find(id)[:control]
			if @clock == 45
				# puts 'half time'
				if Match.find(id)[:control]
					Match.find(id).match_events.create(time: @clock, event_type: 2, event_text: 'Half time, time for a break', team_id: Match.find(id)[:home_team_id], zone: Match.find(id)[:possesion_zone])
				else
					Match.find(id).match_events.create(time: @clock, event_type: 2, event_text: 'Half time, time for a break', team_id: Match.find(id)[:away_team_id], zone: Match.find(id)[:possesion_zone])
				end
				Match.find(id).update(control: false)
				Match.find(id).update(possesion_zone: 4)
			elsif @clock == 90
				# puts 'full time'
				if Match.find(id)[:home_team_score] > Match.find(id)[:away_team_score]
					Match.find(id).match_events.create(time: @clock, event_type: 3, event_text: 'Full time, ' + @home_team_name + ' have won', team_id: Match.find(id)[:home_team_id], zone: Match.find(id)[:possesion_zone])
				elsif Match.find(id)[:home_team_score] < Match.find(id)[:away_team_score]
					Match.find(id).match_events.create(time: @clock, event_type: 3, event_text: 'Full time, ' + @away_team_name + ' have won', team_id: Match.find(id)[:away_team_id], zone: Match.find(id)[:possesion_zone])
				else
					Match.find(id).match_events.create(time: @clock, event_type: 3, event_text: "Full time, they'll have to settle for a draw", team_id: Match.find(id)[:away_team_id], zone: Match.find(id)[:possesion_zone])
				end
			else
				if @clock == 46
					Match.find(id).match_events.create(time: @clock, event_type: 6, event_text: @away_team_name + ' are kicking off', team_id: Match.find(id)[:away_team_id], zone: Match.find(id)[:possesion_zone])
				end
				pass home_team_squad,away_team_squad,id
			end
			clock += 1
		end
	end

	def build_match_squad match_id,team_id

		@squad_arr = [[],[],[],[]]

		Match.find(match_id).match_stats.each do |player|
			if player.game_players[0][:game_team_id] == team_id
				name = player.game_players[0].source_player[:name]
				game_player_id = player.game_players[0][:id]
				source_player_id = player.game_players[0].source_player[:id]
				position = player.game_players[0].source_player[:position]
				goalkeeping_ability = player.game_players[0].source_player[:goalkeeping_ability]
				defending_ability = player.game_players[0].source_player[:defending_ability]
				attacking_ability = player.game_players[0].source_player[:attacking_ability]
				# create a hash out of the above info
				player_hash = {
					name: name,
					game_player_id: game_player_id,
					source_player_id: source_player_id,
					position: position,
					goalkeeping_ability: goalkeeping_ability,
					defending_ability: defending_ability,
					attacking_ability: attacking_ability
				}
				if player_hash[:position] == "1"
					@squad_arr[0].push player_hash
				elsif player_hash[:position] == "2"
					@squad_arr[1].push player_hash
				elsif player_hash[:position] == "3"
					@squad_arr[2].push player_hash
				elsif player_hash[:position] == "4"
					@squad_arr[3].push player_hash
				end
			end
		end

		squad_hash = {
			goalkeeper:		@squad_arr[0],
			defenders:		@squad_arr[1],
			midfielders:	@squad_arr[2],
			attackers:		@squad_arr[3],
			score:			0, 
			name: 			GameTeam.find(team_id).source_team[:name]
		}
	end

	# function to pass the ball
	def pass home_team_squad,away_team_squad,id
		control = Match.find(id)[:control]
		zone = Match.find(id)[:possesion_zone]
		midpoint = pass_midpoint_calc home_team_squad,away_team_squad,id
		pass = rand()
		if pass <= midpoint
			# 'passed'
			if control && zone < 7
				Match.find(id).update(possesion_zone: zone + 1)
				Match.find(id).match_events.create(time: @clock, event_type: 8, event_text: @home_team_name + ' have passed the ball', team_id: Match.find(id)[:home_team_id], zone: Match.find(id)[:possesion_zone])
			elsif !control && zone > 1
				Match.find(id).update(possesion_zone: zone - 1)
				Match.find(id).match_events.create(time: @clock, event_type: 8, event_text: @away_team_name + ' have passed the ball', team_id: Match.find(id)[:away_team_id], zone: Match.find(id)[:possesion_zone])
			else 
				shoot home_team_squad,away_team_squad,id
			end
		else
			# 'intercepted'
			Match.find(id).update(control: !control)
			if Match.find(id)[:control]
				Match.find(id).match_events.create(time: @clock, event_type: 9, event_text: @home_team_name + ' have intercepted the pass', team_id: Match.find(id)[:home_team_id], zone: Match.find(id)[:possesion_zone])
			else
				Match.find(id).match_events.create(time: @clock, event_type: 9, event_text: @away_team_name + ' have intercepted the pass', team_id: Match.find(id)[:away_team_id], zone: Match.find(id)[:possesion_zone])
			end
		end
	end

	def shoot home_team_squad,away_team_squad,id
		control = Match.find(id)[:control]
		midpoint = shot_midpoint_calc home_team_squad,away_team_squad,id
		# puts 'shooting...'
		if control
			Match.find(id).match_events.create(time: @clock, event_type: 10, event_text: @home_team_name + ' are shooting...', team_id: Match.find(id)[:home_team_id], zone: Match.find(id)[:possesion_zone])
		else
			Match.find(id).match_events.create(time: @clock, event_type: 10, event_text: @away_team_name + ' are shooting...', team_id: Match.find(id)[:away_team_id], zone: Match.find(id)[:possesion_zone])
		end
		shot = rand()
		if shot <= midpoint
			# puts '...scored!'
			if control
				# home team scores
				Match.find(id).update(home_team_score: Match.find(id)[:home_team_score] + 1)
				Match.find(id).match_events.create(time: @clock, event_type: 4, event_text: @home_team_name + ' have scored!!!!', team_id: Match.find(id)[:home_team_id], zone: Match.find(id)[:possesion_zone])
				# set poss zone to 4
				Match.find(id).update(possesion_zone: 4)
				# switch control
				Match.find(id).update(control: !control)
				Match.find(id).match_events.create(time: @clock, event_type: 4, event_text: @away_team_name + ' will kick off', team_id: Match.find(id)[:away_team_id], zone: Match.find(id)[:possesion_zone])
			else
				# away team scores
				Match.find(id).update(away_team_score: Match.find(id)[:away_team_score] + 1)
				Match.find(id).match_events.create(time: @clock, event_type: 4, event_text: @away_team_name + ' have scored!!!!', team_id: Match.find(id)[:away_team_id], zone: Match.find(id)[:possesion_zone])
				# set poss zone to 4
				Match.find(id).update(possesion_zone: 4)
				# switch control
				Match.find(id).update(control: !control)
				Match.find(id).match_events.create(time: @clock, event_type: 4, event_text: @home_team_name + ' will kick off', team_id: Match.find(id)[:home_team_id], zone: Match.find(id)[:possesion_zone])
			end
		else
			# puts '...missed!'
			if control
				Match.find(id).match_events.create(time: @clock, event_type: 5, event_text: @away_team_name + ' have missed', team_id: Match.find(id)[:away_team_id], zone: Match.find(id)[:possesion_zone])
			else
				Match.find(id).match_events.create(time: @clock, event_type: 5, event_text: @home_team_name + ' have missed', team_id: Match.find(id)[:home_team_id], zone: Match.find(id)[:possesion_zone])
			end
			Match.find(id).update(control: !control)
		end	
	end

	def pass_midpoint_calc home_team_squad,away_team_squad,id
		zone = Match.find(id)[:possesion_zone]
		control = Match.find(id)[:control]
		if control
			if zone >= 6
				attacking = home_team_squad[:attackers]
				defending = away_team_squad[:defenders]
			elsif zone >= 3
				attacking = home_team_squad[:midfielders]
				defending = away_team_squad[:midfielders]
			else
				attacking = home_team_squad[:defenders]
				defending = away_team_squad[:attackers]
			end	
		else
			if zone <= 2 
				attacking = away_team_squad[:attackers]
				defending = home_team_squad[:defenders]
			elsif zone <= 5
				attacking = away_team_squad[:midfielders]
				defending = home_team_squad[:midfielders]
			else
				attacking = away_team_squad[:defenders]
				defending = home_team_squad[:attackers]
			end	
		end
		att_player = attacking.sample
		# puts att_player[:attacking_ability]
		att_pos_ave = pos_ave attacking,true
		def_player = defending.sample
		# puts def_player[:defending_ability]
		def_pos_ave = pos_ave defending,false
		(att_player[:attacking_ability] + att_pos_ave)/(att_player[:attacking_ability] + att_pos_ave + def_player[:defending_ability] + def_pos_ave)
	end

	def pos_ave position_array,attacking
		if attacking
			key = :attacking_ability
		else
			key = :defending_ability
		end
		total = 0
		position_array.each do |player|
			total = total + player[key]
		end
		total/position_array.length
	end

	def shot_midpoint_calc home_team_squad,away_team_squad,id
		control = Match.find(id)[:control]
		if control
			forward = home_team_squad[:attackers].sample
			forward[:attacking_ability]/(forward[:attacking_ability] + away_team_squad[:goalkeeper][0][:goalkeeping_ability])
		else
			forward = away_team_squad[:attackers].sample
			forward[:attacking_ability]/(forward[:attacking_ability] + home_team_squad[:goalkeeper][0][:goalkeeping_ability])
		end
	end

end