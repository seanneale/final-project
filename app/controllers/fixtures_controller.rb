class FixturesController < ApplicationController
	def show
		puts params
		render json: Fixture.all
	end
end
