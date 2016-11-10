class Api::LeaguesController < ApplicationController
	def index
		puts current_user
		render json: current_user.leagues
	end
end
