class Activity < ApplicationRecord
  belongs_to :category
  belongs_to :city

  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
