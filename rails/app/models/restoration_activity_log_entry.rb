class RestorationActivityLogEntry < ApplicationRecord
  belongs_to :nursery_table, optional: true
  belongs_to :dive, optional: true
  has_many_attached :images
end
