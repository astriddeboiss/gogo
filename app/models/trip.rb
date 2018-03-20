class Trip < ApplicationRecord
  has_many :trip_activities
  belongs_to :city
  belongs_to :user
end
