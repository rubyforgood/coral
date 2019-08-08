# Links a user with the dive they initiated.
#
# NB: Not actually used anywhere in the application; I'm not entirely sure
# this is necessary
class UserDive < ApplicationRecord
  belongs_to :user
  belongs_to :dive
end
