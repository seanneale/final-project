class GameTeam < ApplicationRecord
	belongs_to	:user, optional: true
	belongs_to	:league
	belongs_to	:source_team
	has_many	:game_players
	has_many	:game_team_matches
	has_many	:matches, through: :game_team_matches
end
