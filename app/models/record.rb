class Record < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true
  validates :artist, presence: true
  validates :status, inclusion: { in: %w[active inactive pending], message: "%{value} is not a valid status" }, allow_nil: true
end
