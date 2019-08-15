# A zone is the overarching organizational concept;
#
# All zones have nursery tables, and they are the vital information linking
# coral gathering to where that coral is later allowed to be placed.
#
# That said, we should avoid having heavy links from this class; it's much
# better to use the zone as a value object key, and ask other collections
# to narrow themselves to entries in a particular zone.  this leaves things
# open for more flexibility down the line.
class Zone < ApplicationRecord
  validates :name, uniqueness: true
end
