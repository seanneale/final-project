class League < ApplicationRecord
	has_many :user_leagues
	has_many :users, through: :user_leagues
	has_many :rounds
	has_many :game_teams
end
