class UserPreference < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :trip
end
