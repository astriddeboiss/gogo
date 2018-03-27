class Category < ApplicationRecord
  has_many :activities
  has_many :user_preferences

  mount_uploader :photo, PhotoUploader
  mount_uploader :icon, PhotoUploader
end
