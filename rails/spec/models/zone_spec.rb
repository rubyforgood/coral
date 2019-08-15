require "rails_helper"

RSpec.describe Zone, type: :model do
  let(:zone) { Zone.new(name: "A") }

  it "is has valid attributes" do
    expect(zone).to be_valid
    expect(zone).to have_attributes(name: "A")
  end
end
