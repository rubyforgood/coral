require "rails_helper"

RSpec.describe Zone, type: :model do
  let(:zone) { create :zone, name: "Fake name" }

  it "has a valid factory", :aggregate_failures do
    expect(zone).to be_valid
    expect(zone).to have_attributes(name: "Fake name")
  end
end
