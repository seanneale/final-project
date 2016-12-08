class SourcePlayer < ApplicationRecord
	belongs_to	:source_team
	has_many 	:game_players
end
