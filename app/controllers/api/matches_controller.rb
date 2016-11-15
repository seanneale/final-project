class Api::MatchesController < ApplicationController

	def show
		response = {}
		response[:match] = Match.find(params[:id])
		response[:match_events] = Match.find(params[:id]).match_events
		render json: response
	end

end
