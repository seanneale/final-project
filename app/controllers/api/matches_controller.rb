class Api::MatchesController < ApplicationController

	def show
		MatchWorker.perform_async()
		response = {}
		response[:match] = Match.find(params[:id])
		response[:match_events] = Match.find(params[:id]).match_events
		response[:league_id] = Match.find(params[:id]).round.league[:id]
		user_id = Match.find(params[:id]).round.league.users[0][:id]
		response[:game_team_id] = Match.find(params[:id]).round.league.game_teams.find_by(user_id: user_id)[:id]
		render json: response
	end

end
