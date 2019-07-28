class Zone < ApplicationRecord
  validates :name, uniqueness: true
end
