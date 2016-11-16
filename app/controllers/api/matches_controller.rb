class Api::MatchesController < ApplicationController

	def show
		MatchWorker.perform_async()
		response = {}
		response[:match] = Match.find(params[:id])
		response[:match_events] = Match.find(params[:id]).match_events
		response[:league_id] = Match.find(params[:id]).round.league[:id]
		render json: response
	end

end
