# Represents the individual nursery tables.
#
# This is mostly a data class, storing the names of a trable, and the zone
# to which the table belongs.  It's used to populate zone-scoped select
# lists when filling out log entries.
class NurseryTable < ApplicationRecord
  belongs_to :zone
  validates :capacity, numericality: { greater_than_or_equal_to: 1 }
end
