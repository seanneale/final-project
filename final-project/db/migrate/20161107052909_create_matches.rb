class CreateMatches < ActiveRecord::Migration[5.0]
	def change
		create_table :matches do |t|
			t.belongs_to	:round
			t.boolean	:played
			t.boolean	:background
			t.boolean	:home_team_picked
			t.boolean	:away_team_picked
			t.integer	:home_team_id
			t.integer	:away_team_id
			t.integer	:home_team_score
			t.integer	:away_team_score
			t.timestamps
		end
	end
end
