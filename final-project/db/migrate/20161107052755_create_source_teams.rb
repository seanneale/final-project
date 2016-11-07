class CreateSourceTeams < ActiveRecord::Migration[5.0]
	def change
		create_table :source_teams do |t|
			t.string	:name
			t.string	:home_colour_1
			t.string	:home_colour_2
			t.string	:away_colour_1
			t.string	:away_colour_2
			t.string	:badge_url
			t.integer	:fpl_id
			t.timestamps
		end
	end
end
