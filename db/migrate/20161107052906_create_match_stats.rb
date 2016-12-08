class CreateMatchStats < ActiveRecord::Migration[5.0]
	def change
		create_table :match_stats do |t|
			t.belongs_to		:match
			t.integer		:shots, :default => 0
			t.integer		:goals_scored, :default => 0
			t.integer		:assists, :default => 0	
			t.integer		:attempted_passes, :default => 0
			t.integer		:succesful_passes, :default => 0
			t.integer		:interceptions, :default => 0
			t.timestamps
		end
	end
end
