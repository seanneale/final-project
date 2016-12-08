class Match < ApplicationRecord
	has_many	:game_team_match
	has_many	:game_team, through: :game_team_match
	belongs_to	:round
	has_many	:match_stats
	has_many	:match_events
end
