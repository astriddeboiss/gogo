class AddTripIdToUserPreferences < ActiveRecord::Migration[5.1]
  def change
    add_reference(:user_preferences, :trip)
  end
end
