class SourceTeam < ApplicationRecord
	has_many	:game_teams
	has_many	:source_players
end
