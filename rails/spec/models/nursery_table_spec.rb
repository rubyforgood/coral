require "rails_helper"

RSpec.describe NurseryTable, type: :model do
  let(:zone) { Zone.new(id: 1, name: "A") }
  let(:nursery) { NurseryTable.new(capacity: 200, name: "A", zone_id: zone.id) }

  it "has valid attributes" do
    expect(nursery).to have_attributes(capacity: 200, name: "A", zone_id: zone.id)
  end

  it "cannot have negative capacity" do
    nursery = NurseryTable.new(capacity: -20, name: "A", zone_id: zone.id)
    expect(nursery).to_not be_valid
  end

  it "cannot be zero" do
    zone = Zone.create(id: 13, name: "Add me")
    nursery = NurseryTable.new(capacity: 0, name: "A", zone_id: zone.id)
    expect(nursery).to_not be_valid
  end

  it "atleast has one" do
    zone = Zone.create(id: 23, name: "Add me")
    nursery = NurseryTable.new(capacity: 1, name: "A", zone_id: zone.id)
    expect(nursery).to be_valid
  end
end
