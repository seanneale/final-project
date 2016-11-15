class CreateGamePlayers < ActiveRecord::Migration[5.0]
	def change
		create_table :game_players do |t|
			t.belongs_to	:game_team
			t.belongs_to	:source_player
			t.boolean		:available
			t.integer		:injury_type, :default => 0
			t.integer		:recovery_length, :default => 0
			t.integer		:season_shots, :default => 0
			t.integer		:season_goals_scored, :default => 0
			t.integer		:season_assists, :default => 0	
			t.integer		:season_attempted_passes, :default => 0
			t.integer		:season_succesful_passes, :default => 0
			t.integer		:season_interceptions, :default => 0
			t.timestamps
		end
	end
end
