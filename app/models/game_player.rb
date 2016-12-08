class GamePlayer < ApplicationRecord
	belongs_to	:game_team	
	belongs_to	:source_player
	has_many	:game_players_match_stat
	has_many	:match_stats, through: :game_players_match_stat
end
