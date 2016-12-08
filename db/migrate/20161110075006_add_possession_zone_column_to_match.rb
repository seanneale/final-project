class AddPossessionZoneColumnToMatch < ActiveRecord::Migration[5.0]
	def change
		add_column :matches, :possesion_zone, :integer, :default => 4
	end
end
