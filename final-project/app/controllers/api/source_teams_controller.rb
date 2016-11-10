class Api::SourceTeamsController < ApplicationController
	def index
		@teams = SourceTeam.all
		render json: @teams
	end
end
