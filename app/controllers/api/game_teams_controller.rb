class Api::GameTeamsController < ApplicationController
	def index
		puts params
		render json: GameTeam.find_by(user_id: params[:user_id])
	end

	def show
		change_active_round
		match = GameTeam.find(params[:id]).league.rounds.find_by(active: true).matches.find_by(home_team_id: params[:id]) || GameTeam.find(params[:id]).league.rounds.find_by(active: true).matches.find_by(away_team_id: params[:id])
		@current_team = {
			match: match,
			game_team: GameTeam.find(params[:id]),
			game_players: GameTeam.find(params[:id]).game_players,
			source_team: GameTeam.find(params[:id]).source_team,
			source_players: GameTeam.find(params[:id]).source_team.source_players
		}
		render json: @current_team
	end

	def change_active_round
		active_rounds = Round.where(active: true)
		active_rounds.each do |round|
			counter = 0
			round.matches.each do |match|
				match[:played] ? counter += 1 : counter
			end
			if counter == 10
				# change active round
				round.update(active: false)
				Round.find(round[:id] + 1).update(active: true)
			end
		end
		AutopickWorker.perform_async()
	end
end
