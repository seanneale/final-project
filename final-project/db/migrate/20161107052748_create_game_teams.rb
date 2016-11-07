class CreateGameTeams < ActiveRecord::Migration[5.0]
	def change
		create_table :game_teams do |t|
			t.belongs_to	:user
			t.belongs_to	:league
			t.belongs_to	:source_team
			t.integer	:win
			t.integer	:draw
			t.integer	:loss
			t.integer	:goals_for
			t.integer	:goals_against
			t.timestamps
		end
	end
end
