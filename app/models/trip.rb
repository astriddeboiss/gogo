class Trip < ApplicationRecord
  has_many :trip_activities
  has_many :activities, through: :trip_activities
  belongs_to :city
  belongs_to :user
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
