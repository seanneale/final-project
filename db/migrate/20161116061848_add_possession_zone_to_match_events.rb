class AddPossessionZoneToMatchEvents < ActiveRecord::Migration[5.0]
  def change
  	add_column :match_events, :possesion_zone, :integer
  end
end
