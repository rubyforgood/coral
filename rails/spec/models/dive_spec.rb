require "rails_helper"

RSpec.describe Dive do
  describe "validations" do
    let(:dive) { build(:dive) }

    describe "has a factory valid" do
      it { expect(dive).to be_valid }
    end

    context "requires the diver to have been responsible" do
      describe "responsible is false" do
        let(:dive_not_responsible) { build :dive, i_have_been_responsible: false }

        it { expect(subject).not_to be_valid }
      end
      describe "responsible is nil" do
        let(:dive_not_responsible) { build :dive, i_have_been_responsible: nil }

        it { expect(subject).not_to be_valid }
      end
    end
  end

  describe "finishing the dive" do
    let(:dive) { build :dive }
    let!(:action) { dive.finish }

    it { expect(dive.finished_at).to be_present }
  end

  context "checking if a dive is finished" do
    let(:dive) { create :dive }
    describe "finished now" do
      let!(:action) { dive.finished_at = Time.zone.now }

      it { expect(dive).to be_finished }
    end

    describe "does not finished" do
      let!(:action) { dive.finished_at = nil }

      it { expect(dive).not_to be_finished }
    end
  end
end
