require "rails_helper"

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

  describe "finishing the dive" do
    it "sets the finish time" do
      subject = FactoryBot.create(:dive)

      subject.finish

      expect(subject.finished_at).to be_present
    end
  end

  describe "checking if a dive is finished" do
    it "is true if finished_at is set" do
      subject = FactoryBot.build(:dive)
      subject.finished_at = Time.zone.now

      expect(subject).to be_finished
    end

    it "is false if finished_at is notset" do
      subject = FactoryBot.build(:dive)
      subject.finished_at = nil

      expect(subject).not_to be_finished
    end
  end
end
