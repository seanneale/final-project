class AddAppearancesColumnToGameTeam < ActiveRecord::Migration[5.0]
  def change
  	add_column :game_teams, :games_played, :integer, :default => 0
  end
end
