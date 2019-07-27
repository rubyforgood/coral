class Dive < ApplicationRecord
  attr_accessor :i_have_been_responsible

  validates :i_have_been_responsible,
    acceptance: true,
    presence: true,
    on: :create

  def finish
    self.update(finished_at: Time.now)
  end

  def finished?
    finished_at.present?
  end
end
