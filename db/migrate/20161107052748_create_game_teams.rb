class CreateGameTeams < ActiveRecord::Migration[5.0]
	def change
		create_table :game_teams do |t|
			t.belongs_to	:user
			t.belongs_to	:league
			t.belongs_to	:source_team
			t.integer	:win, :default => 0
			t.integer	:draw, :default => 0
			t.integer	:loss, :default => 0
			t.integer	:goals_for, :default => 0
			t.integer	:goals_against, :default => 0
			t.integer	:goal_difference, :default => 0
			t.integer	:points, :default => 0
			t.timestamps
		end
	end
end
