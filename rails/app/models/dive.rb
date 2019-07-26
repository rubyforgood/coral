class Dive < ApplicationRecord
  attr_accessor :i_have_been_responsible

  validates :i_have_been_responsible,
    acceptance: true,
    presence: true
end
