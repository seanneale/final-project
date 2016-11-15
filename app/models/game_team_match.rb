class GameTeamMatch < ApplicationRecord
	belongs_to	:match
	belongs_to	:game_team
end
