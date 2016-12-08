class CreateRounds < ActiveRecord::Migration[5.0]
	def change
		create_table :rounds do |t|
			t.belongs_to	:league
			t.date		:date
			t.boolean	:active
			t.timestamps
		end
	end
end
