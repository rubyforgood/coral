# Base record from which all others inherit
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
