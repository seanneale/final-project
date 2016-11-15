class GamePlayersMatchStat < ApplicationRecord
	belongs_to	:game_player
	belongs_to	:match_stat
end
