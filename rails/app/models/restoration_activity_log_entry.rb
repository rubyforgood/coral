# A record of the current state of a nursery table.
#
# This is intended to be a write only table; log entries will accumulate
# over time, and should _not_ be written to or updated after the dive is
# completed.  The one exception to this is the process of adding images to
# the log after the dive has completed.
class RestorationActivityLogEntry < ApplicationRecord
  belongs_to :nursery_table, optional: true
  belongs_to :dive, optional: true
  has_many_attached :images
end
