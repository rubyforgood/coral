# A Dive represents the period of time when a user is going to work;
#
# This is mostly a bookkeeping class, as an effort to attempt to find start
# and end times.
class Dive < ApplicationRecord
  has_many :user_dives
  has_many :users, through: :user_dives

  attr_accessor :i_have_been_responsible

  validates :i_have_been_responsible,
            acceptance: true,
            presence: true,
            on: :create

  def finish
    update(finished_at: Time.zone.now)
  end

  def finished?
    finished_at.present?
  end
end
