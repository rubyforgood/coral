require "rails_helper"

RSpec.describe NurseryTable, type: :model do
  let(:zone) { create :zone, id: 1 }
  context "validates" do
    describe "has a factory valid" do
      subject(:nursery) { create :nursery_table, zone_id: zone.id }

      it { expect(nursery).to be_valid }
    end
  end
end
