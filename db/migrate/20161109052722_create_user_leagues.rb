class CreateUserLeagues < ActiveRecord::Migration[5.0]
	def change
		create_table :user_leagues do |t|
			t.belongs_to	:user
			t.belongs_to	:league
			t.timestamps
		end
	end
end
