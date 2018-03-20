class Activity < ApplicationRecord
  belongs_to :category
  belongs_to :city

  mount_uploader :photo, PhotoUploader
end
