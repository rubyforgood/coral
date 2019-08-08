require "rails_helper"

RSpec.describe "Nursery Tables", type: :request do
  let(:current_user) { FactoryBot.create(:user) }
  before do
    sign_in(current_user)
  end

  describe "GET and POST requests do" do
    let!(:nursery_table) { FactoryBot.create(:nursery_table, zone: zone) }
    let!(:zone) { FactoryBot.create(:zone) }

    it "renders the nursery table" do
      get nursery_tables_path

      expect(response).to be_successful
    end

    it "allows to create nursery table" do
      post nursery_tables_path, params: { nursery_table: { capacity: 24, name: "Blah", zone: zone } }

      expect(response).to have_http_status(200)
    end
  end
end
