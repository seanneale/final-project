class CreateGameTeamMatches < ActiveRecord::Migration[5.0]
	def change
		create_table :game_team_matches do |t|
			t.belongs_to	:match
			t.belongs_to	:game_team
			t.timestamps
		end
	end
end
