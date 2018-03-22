class RemoveMarkAsDoneFromActivities < ActiveRecord::Migration[5.1]
  def change
    remove_column :activities, :mark_as_done
  end
end
