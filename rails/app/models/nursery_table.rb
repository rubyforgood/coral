class NurseryTable < ApplicationRecord
  belongs_to :zone
  validates :capacity, numericality: { greater_than_or_equal_to: 1 }
end
