class Api::LeaguesController < ApplicationController
	before_action :table_update, only: [:show]

	def index
		response = {}
		response[:leagues] = User.find(params[:user_id]).leagues
		response[:game_teams] = []
		response[:leagues].each do |league|
			game_team = GameTeam.find_by(user_id: params[:user_id], league_id: league.id)
			response[:game_teams].push game_team
		end
		render json: response
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
		response[:rounds] = League.find(params[:id]).rounds.all
		response[:fixtures] = []
		response[:rounds].each do |round|
			response[:fixtures].push round.matches.all
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