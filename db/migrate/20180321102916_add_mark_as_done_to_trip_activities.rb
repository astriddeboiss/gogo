class AddMarkAsDoneToTripActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :trip_activities, :mark_as_done, :boolean, default: false
  end
end
