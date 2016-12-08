class AddTimeColumnToMatchEvents < ActiveRecord::Migration[5.0]
  def change
		add_column :match_events, :time, :integer
  end
end
