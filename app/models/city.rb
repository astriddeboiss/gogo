class City < ApplicationRecord
  has_many :activities
  has_many :trips

  mount_uploader :photo, PhotoUploader
end
