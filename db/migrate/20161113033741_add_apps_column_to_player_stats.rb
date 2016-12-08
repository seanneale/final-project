class AddAppsColumnToPlayerStats < ActiveRecord::Migration[5.0]
	def change
		add_column :game_players, :appearances, :integer, :default => 0
	end
end
