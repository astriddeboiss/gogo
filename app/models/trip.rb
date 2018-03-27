class Trip < ApplicationRecord
  has_many :trip_activities
  has_many :user_preferences
  has_many :activities, through: :trip_activities
  belongs_to :city
  belongs_to :user
end
