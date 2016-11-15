class AddNewColumnToUser < ActiveRecord::Migration[5.0]
	def change
		add_column :users, :oauth_expires_at, :datetime
	end
end
