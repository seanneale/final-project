class AutopickWorker
	include Sidekiq::Worker

	def perform
		# for every team without a user pick a squad for the next match
		# for each team in GameTeam, check to see if the active game has been been picked for that team
		all_game_teams = GameTeam.all
		# find the active round
		all_game_teams.each do |game_team|
			# puts game_team.league.rounds.find_by(active: true).matches.to_s
			# find the game_team's match
			# check to see if the team has been picked yet
			if game_team.league.rounds.find_by(active: true).matches.find_by(home_team_id: game_team[:id])
				home = true
			elsif game_team.league.rounds.find_by(active: true).matches.find_by(away_team_id: game_team[:id])
				home = false
			end
			if home && game_team.league.rounds.find_by(active: true).matches.find_by(home_team_id: game_team[:id])
				match_id = game_team.league.rounds.find_by(active: true).matches.find_by(home_team_id: game_team[:id])[:id]
				picked = game_team.league.rounds.find_by(active: true).matches.find_by(home_team_id: game_team[:id])[:home_team_picked]
			elsif !home && game_team.league.rounds.find_by(active: true).matches.find_by(away_team_id: game_team[:id])
				match_id = game_team.league.rounds.find_by(active: true).matches.find_by(away_team_id: game_team[:id])[:id]
				picked = game_team.league.rounds.find_by(active: true).matches.find_by(away_team_id: game_team[:id])[:away_team_picked]
			else
				picked = true
			end
			# check to see if autopick is needed
			if game_team[:user_id]
				autopick = false
			else
				autopick = true
			end
			puts '.'
			puts '1234567890qwertyuiopllkjhgfdsazxcvbnm'
			puts '.'
			puts picked
			puts autopick
			if !picked && autopick
		# if it hasn't been picked yet then pick the team and update the team as picked
				choices = []
				choices.concat goalkeeper_autopicker game_team,1
				puts 1
				choices.concat defender_autopicker game_team,4
				choices.concat midfielder_autopicker game_team,4
				choices.concat attacker_autopicker game_team,2
				puts choices.to_s
				# create new match stats section
				choices.each do |choice|
					GamePlayer.find(choice).match_stats.create(match_id: match_id)
				end
				# mark team as picked 
				if home && Match.find(match_id).update(home_team_picked: true)
					Match.find(match_id).update(home_team_picked: true)
				elsif !home && Match.find(match_id).update(away_team_picked: true)
					Match.find(match_id).update(away_team_picked: true)
				end
		# 	else 
		# # do nothing otherwise
		# 		puts 'do nothing'
			end
		end
		MatchWorker.perform_async()

	end

	def goalkeeper_autopicker team,limit
		picked_squad = []
		players = team.source_team.source_players.where(position: 1).order(goalkeeping_ability: :desc)
		i = 0
		while i < limit do
			source_player_id = players[i][:id]
			game_player_id = team.game_players.find_by(source_player_id: source_player_id)[:id]
			picked_squad.push game_player_id
			i += 1
		end
		picked_squad
	end

	def defender_autopicker team,limit
		picked_squad = []
		players = team.source_team.source_players.where(position: 2).order(defending_ability: :desc)
		i = 0
		while i < limit do
			source_player_id = players[i][:id]
			game_player_id = team.game_players.find_by(source_player_id: source_player_id)[:id]
			picked_squad.push game_player_id
			i += 1
		end
		picked_squad
	end


	def attacker_autopicker team,limit
		picked_squad = []
		players = team.source_team.source_players.where(position: 4).order(attacking_ability: :desc)
		i = 0
		while i < limit do
			source_player_id = players[i][:id]
			game_player_id = team.game_players.find_by(source_player_id: source_player_id)[:id]
			picked_squad.push game_player_id
			i += 1
		end
		picked_squad
	end

	def midfielder_autopicker team,limit
		picked_squad = []
		players = team.source_team.source_players.where(position: 3).order(defending_ability: :desc)
		i = 0
		while i < limit do
			source_player_id = players[i][:id]
			game_player_id = team.game_players.find_by(source_player_id: source_player_id)[:id]
			picked_squad.push game_player_id
			i += 1
		end
		# att_mid_limit = limit / 2
		# def_mid_limit = limit - att_mid_limit
		# i = 0
		# j = 0
		# already_picked = []
		# while i < att_mid_limit do
		# 	already_picked.push players[i][:id]
		# 	source_player_id = players[i][:id]
		# 	game_player_id = team.game_players.find_by(source_player_id: source_player_id)[:id]
		# 	picked_squad.push game_player_id
		# 	i += 1
		# end
		# players = team.source_team.source_players.where(position: 3).where.not(id: already_picked[0]).where.not(id: already_picked[1]).order(defending_ability: :desc)
		# while j < def_mid_limit do
		# 	source_player_id = players[i][:id]
		# 	game_player_id = team.game_players.find_by(source_player_id: source_player_id)[:id]
		# 	picked_squad.push game_player_id
		# 	j += 1
		# end
		picked_squad
	end

end