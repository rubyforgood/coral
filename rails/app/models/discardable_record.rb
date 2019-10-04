# Inherit from this record if you have a `discarded_at` column
# in your model table and want to implemente soft deletes using
# the `discard` gem methods
class DiscardableRecord < ApplicationRecord
  include Discard::Model
  self.abstract_class = true
end
