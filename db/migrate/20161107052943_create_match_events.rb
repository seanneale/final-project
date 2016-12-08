class CreateMatchEvents < ActiveRecord::Migration[5.0]
	def change
		create_table :match_events do |t|
			t.belongs_to	:match
			t.integer	:player_id
			t.integer	:team_id
			t.integer	:event_type
			t.string	:event_text
			t.timestamps
		end
	end
end
