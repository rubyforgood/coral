require 'rails_helper'

RSpec.describe NurseryTable, type: :model do

  let(:zone) { Zone.new(id: 1, name:"A")}
  let(:nursery) { NurseryTable.new(capacity: 200 ,name: "A", zone_id: zone.id)}
  
  it "has valid attributes" do
    expect(nursery).to have_attributes(capacity: 200, name: "A", zone_id: zone.id)
  end
end
