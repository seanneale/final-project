class MatchStat < ApplicationRecord
	has_many	:game_players_match_stat
	has_many	:game_players, through: :game_players_match_stat
	belongs_to	:match
end
