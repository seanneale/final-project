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
			new_league.rounds.create(date: date, active: false)
		end
		# link user to chosen game team
		new_team = GameTeam.find_by(league_id: new_league[:id], source_team_id: params[:game_team_id])
		new_team.update(user_id: params[:user_id])
		FixtureWorker.perform_async(new_league[:id])
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

end