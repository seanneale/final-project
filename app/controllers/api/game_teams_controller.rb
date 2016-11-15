class Api::GameTeamsController < ApplicationController
	def index
		puts params
		render json: GameTeam.find_by(user_id: params[:user_id])
	end

	def show
		@current_team = {
			game_team: GameTeam.find(params[:id]),
			game_players: GameTeam.find(params[:id]).game_players,
			source_team: GameTeam.find(params[:id]).source_team,
			source_players: GameTeam.find(params[:id]).source_team.source_players
		}
		puts @current_team
		render json: @current_team
	end
end
