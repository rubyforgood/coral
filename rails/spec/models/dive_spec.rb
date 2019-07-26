require 'rails_helper'

RSpec.describe Dive do
  describe "validations" do
    subject { FactoryBot.build(:dive) }

    it "has a valid state" do
      expect(subject).to be_valid
    end

    it "requires the diver to have been responsible" do
      subject.i_have_been_responsible = false
      expect(subject).not_to be_valid

      subject.i_have_been_responsible = nil
      expect(subject).not_to be_valid
    end
  end
end