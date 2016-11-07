class CreateMatchStats < ActiveRecord::Migration[5.0]
	def change
		create_table :match_stats do |t|
			t.belongs_to		:match
			t.integer		:shots
			t.integer		:goals_scored
			t.integer		:assists
			t.integer		:attempted_passes
			t.integer		:succesful_passes
			t.integer		:interceptions
			t.timestamps
		end
	end
end
