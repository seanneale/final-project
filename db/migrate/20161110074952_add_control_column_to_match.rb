class AddControlColumnToMatch < ActiveRecord::Migration[5.0]
	def change
		add_column :matches, :control, :boolean, :default => true
	end
end
