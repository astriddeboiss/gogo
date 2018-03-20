class AddNameToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :name
  end
end
