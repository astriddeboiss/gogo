class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.float :latitude
      t.float :longitude
      t.string :address
      t.datetime :opens_at
      t.datetime :closes_at
      t.integer :duration
      t.boolean :mark_as-done
      t.references :category, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
