class CreateGamePlayers < ActiveRecord::Migration[5.0]
	def change
		create_table :game_players do |t|
			t.belongs_to	:game_team
			t.belongs_to	:source_player
			t.boolean		:available
			t.integer		:injury_type
			t.integer		:recovery_length
			t.integer		:season_shots
			t.integer		:season_goals_scored
			t.integer		:season_assists
			t.integer		:season_attempted_passes
			t.integer		:season_succesful_passes
			t.integer		:season_interceptions
			t.timestamps
		end
	end
end
