class CreateGamePlayersMatchStats < ActiveRecord::Migration[5.0]
	def change
		create_table :game_players_match_stats do |t|
			t.belongs_to	:game_player
			t.belongs_to	:match_stat
			t.timestamps
		end
	end
end
