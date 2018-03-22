class TripActivity < ApplicationRecord
  belongs_to :trip
  belongs_to :activity

  scope :visited, -> { where(mark_as_done: true) }
  scope :not_visited, -> { where(mark_as_done: false) }
end
