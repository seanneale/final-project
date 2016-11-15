class CreateMatches < ActiveRecord::Migration[5.0]
	def change
		create_table :matches do |t|
			t.belongs_to	:round
			t.boolean	:played, :default => false
			t.boolean	:background, :default => false
			t.boolean	:home_team_picked, :default => false
			t.boolean	:away_team_picked, :default => false
			t.integer	:home_team_id
			t.integer	:away_team_id
			t.integer	:home_team_score, :default => 0
			t.integer	:away_team_score, :default => 0
			t.timestamps
		end
	end
end
