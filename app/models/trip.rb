class Trip < ApplicationRecord
  has_many :activities, through :trip_activities
  belongs_to :city
  belongs_to :user
end
