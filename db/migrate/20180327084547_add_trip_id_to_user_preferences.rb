class AddTripIdToUserPreferences < ActiveRecord::Migration[5.1]
  def change
    add_column :user_preferences, :trip_id, :references
  end
end
