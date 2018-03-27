class AddDateToTrip < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :starts_at, :date
    add_column :trips, :ends_at, :date
  end
end
