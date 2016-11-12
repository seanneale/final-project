class Api::LeaguesController < ApplicationController
	def index
		render json: User.find(params[:user_id]).leagues
	end
end
