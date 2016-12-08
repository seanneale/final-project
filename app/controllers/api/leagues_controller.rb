class Api::LeaguesController < ApplicationController
	before_action :table_update, only: [:show]

	def index
		response = {}
		response[:leagues] = User.find(params[:user_id]).leagues
		response[:game_teams] = []
		response[:home_colour_1s] = []
		response[:home_colour_2s] = []
		response[:badge_urls] = []
		response[:next_games] = []
		
		response[:leagues].each do |league|
			game_team = GameTeam.find_by(user_id: params[:user_id], league_id: league.id)
			response[:game_teams].push game_team
			home_colour_1 = game_team.source_team[:home_colour_1]
			response[:home_colour_1s].push home_colour_1
			home_colour_2 = game_team.source_team[:home_colour_2]
			response[:home_colour_2s].push home_colour_2
			badge_url = game_team.source_team[:badge_url]
			response[:badge_urls].push badge_url
			next_game_home = league.rounds.find_by(active: true).matches.find_by(home_team_id: game_team[:id])
			next_game_away = league.rounds.find_by(active: true).matches.find_by(away_team_id: game_team[:id])
			if next_game_home
				next_game = GameTeam.find(next_game_home[:away_team_id]).source_team[:name]
			else 
				next_game = GameTeam.find(next_game_away[:home_team_id]).source_team[:name]
			end
			response[:next_games].push next_game
		end

		render json: response
	end

	def create
		# create new league
		new_league = User.find(params[:user_id]).leagues.create(league_name: params[:league_name])
		puts new_league[:id]
		# create new game teams
		SourceTeam.all.each do |team|
			team.game_teams.create(league_id: new_league[:id])
		end
		# create new game players
		SourcePlayer.all.each do |player|
			game_team_id = player.source_team.game_teams.find_by(league_id: new_league[:id])[:id]
			player.game_players.create(game_team_id: game_team_id)
		end
		# create new rounds
		(0..37).each do |week|
			date = Date.new(2016,8,13) + week * 7
			if week == 0 
				new_league.rounds.create(date: date, active: true)
			else 	
				new_league.rounds.create(date: date, active: false)
			end
		end
		# link user to chosen game team
		new_team = GameTeam.find_by(league_id: new_league[:id], source_team_id: params[:game_team_id])
		new_team.update(user_id: params[:user_id])
		# FixtureWorker.perform_async(new_league[:id])
		fixture_generate new_league[:id]
		mark_matches_as_background
		render json: new_team
	end

	def show
		# TestWorker.perform_async()
		# TestBWorker.perform_async()
		# FixtureWorker.perform_async()
		# MarkMatchesAsBackgroundWorker.perform_async()
		# ChangeActiveRoundWorker.perform_async()
		# AutopickWorker.perform_async()
		# MatchWorker.perform_async()
		response = {}
		response[:source_teams]=SourceTeam.all
		response[:league] = League.find(params[:id])
		response[:rounds] = League.find(params[:id]).rounds.all.order('id')
		response[:fixtures] = []
		response[:rounds].each do |round|
			response[:fixtures].push round.matches.all.order('home_team_id')
		end
		response[:table] = League.find(params[:id]).game_teams.all.order(points: :desc, goal_difference: :desc, goals_for: :desc, win: :desc, source_team_id: :asc)
		render json: response
	end

private
	def table_update
		leagues = League.find(params[:id]).game_teams.all
		leagues.each do |team|
			# puts '.'
			# puts team[:win]
			# puts team[:draw]
			puts points = 3*team[:win] + team[:draw]
			# puts team[:goals_for]
			# puts team[:goals_against]
			puts gd = team[:goals_for] - team[:goals_against]
			team.update(points: points, goal_difference: gd)
			puts team.errors.messages
			puts team[:points]
			puts team[:goal_difference]
		end
	end

	def fixture_generate league_id

		# User.first.leagues.first.rounds[0].update(active: true)
		League.find(league_id).rounds.order('id')[0].update(active: true)
		half_schedule = make_fixture_array
		# @rounds = User.first.leagues.first.rounds
		@rounds = League.find(league_id).rounds
		# team_base_id = User.first.leagues.first.game_teams.order('id')[0][:id]
		team_base_id = League.find(league_id).game_teams.order('id')[0][:id]
		# team_ids = User.first.leagues.first.game_teams.order('id').pluck('id').shuffle!
		team_ids = League.find(league_id).game_teams.order('id').pluck('id').shuffle!
		# team_ids
		(0..18).each do |round|
			half_schedule[round].each do |match|
				# puts match.to_s
				if match[0] == match[1]
					if round % 2 == 0
						@rounds[round].matches.create(played: false, background: false, home_team_picked: false, away_team_picked: false, home_team_score: 0, away_team_score: 0, home_team_id: team_ids[match[0]], away_team_id: team_ids[19])
					else
						newMatch = @rounds[round].matches.create(played: false, background: false, home_team_picked: false, away_team_picked: false, home_team_score: 0, away_team_score: 0, home_team_id: team_ids[19], away_team_id: team_ids[match[0]])
					end	
				else
					newMatch = @rounds[round].matches.create(played: false, background: false, home_team_picked: false, away_team_picked: false, home_team_score: 0, away_team_score: 0, home_team_id: team_ids[match[0]], away_team_id: team_ids[match[1]])
				end
			end
		end
		(0..18).each do |round|
			half_schedule[round].each do |match|
				if match[0] == match[1]
					if round % 2 == 0
						@rounds[round + 19].matches.create(played: false, background: false, home_team_picked: false, away_team_picked: false, home_team_score: 0, away_team_score: 0, home_team_id: team_ids[19], away_team_id: team_ids[match[0]])
					else
						@rounds[round + 19].matches.create(played: false, background: false, home_team_picked: false, away_team_picked: false, home_team_score: 0, away_team_score: 0, home_team_id: team_ids[match[0]], away_team_id: team_ids[19])
					end	
				else
					@rounds[round + 19].matches.create(played: false, background: false, home_team_picked: false, away_team_picked: false, home_team_score: 0, away_team_score: 0, home_team_id: team_ids[match[1]], away_team_id: team_ids[match[0]])
				end
			end
		end

	end

	def make_fixture_array
		@test_array = [
			[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19] ,
			[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,1] ,
			[3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,1,2] ,
			[4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,1,2,3] ,
			[5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,1,2,3,4] ,
			[6,7,8,9,10,11,12,13,14,15,16,17,18,19,1,2,3,4,5] ,
			[7,8,9,10,11,12,13,14,15,16,17,18,19,1,2,3,4,5,6] ,
			[8,9,10,11,12,13,14,15,16,17,18,19,1,2,3,4,5,6,7] ,
			[9,10,11,12,13,14,15,16,17,18,19,1,2,3,4,5,6,7,8] ,
			[10,11,12,13,14,15,16,17,18,19,1,2,3,4,5,6,7,8,9] ,
			[11,12,13,14,15,16,17,18,19,1,2,3,4,5,6,7,8,9,10] ,
			[12,13,14,15,16,17,18,19,1,2,3,4,5,6,7,8,9,10,11] ,
			[13,14,15,16,17,18,19,1,2,3,4,5,6,7,8,9,10,11,12] ,
			[14,15,16,17,18,19,1,2,3,4,5,6,7,8,9,10,11,12,13] ,
			[15,16,17,18,19,1,2,3,4,5,6,7,8,9,10,11,12,13,14] ,
			[16,17,18,19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15] ,
			[17,18,19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16] ,
			[18,19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17] ,
			[19,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18] ,
		]
		fixture_array = []
		# find all i,j where they are equal banana
		(1..19).each do |banana|
			i = 0
			j = 0
			round_array = []
			@test_array.each do |element|
				# puts element.to_s
				j = 0
				element.each do |element|
					if element == banana
						round_array.push [i,j]
					end
					j += 1
				end
				i += 1
			end
			round_array.each do |dupe|
				if dupe[0] == dupe[1]
				elsif round_array.index [dupe[1],dupe[0]]
					round_array.slice!(round_array.index([dupe[1],dupe[0]]),1)
				end
				if banana % 2 == 0
					temp = dupe[0]
					dupe[0] = dupe[1]
					dupe[1] = temp
				end
			end
			fixture_array.push round_array
		end
		fixture_array
	end

	def mark_matches_as_background
		matches = Match.all
		matches.each do |match|
			if !match[:background] && !match[:played]
				home_id = match[:home_team_id]
				away_id = match[:away_team_id]
				if !GameTeam.find(home_id)[:user_id] && !GameTeam.find(away_id)[:user_id]
					match.update(background: true)
				end
			end
		end
	end

end