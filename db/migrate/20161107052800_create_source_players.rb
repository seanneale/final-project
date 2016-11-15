class CreateSourcePlayers < ActiveRecord::Migration[5.0]
	def change
		create_table :source_players do |t|
			t.belongs_to	:source_team
		    t.string	:first_name
		    t.string	:last_name
		    t.string	:name
		    t.string	:position
		    t.float		:attacking_ability
		    t.float		:defending_ability
		    t.float		:goalkeeping_ability
		    t.integer	:squad_number
		    t.float		:form_adjustment
		    t.string	:image_url
		    t.boolean	:available
		    t.integer	:injury_remain
		    t.integer	:injury_id
			t.timestamps
		end
	end
end
