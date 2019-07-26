require 'rails_helper'

RSpec.describe "Dives", type: :request do
  describe "GET show" do
    let!(:dive) { FactoryBot.create(:dive) } 

    it "renders the dive hub" do
      get "/dives/#{dive.id}"

      expect(response).to be_successful
    end
  end

  describe "GET new" do
    it "succeeds" do
      get '/dives/new'

      expect(response).to be_successful
    end
  end

  describe "POST create" do
    context "given a complete checklist" do
      subject do
        -> {
          post '/dives', params: { dive: { i_have_been_responsible: 1 } }
        }
      end

      it "redirects to the dive page" do
        subject.call
        expect(response).to be_redirect

        follow_redirect!
        expect(response).to be_successful
      end

      it "creates the dive" do
        expect { subject.call }.to change { Dive.count }.by(1)
      end
    end

    context "given an incomplete checklist" do
      subject do
        -> {
          post '/dives', params: { dive: { i_have_been_responsible: nil } }
        }
      end

      it "does not create the dive" do
        expect { subject.call }.not_to change { Dive.count }
      end

      it 'renders an error page' do
        subject.call
        expect(response.body).to match(/can&#39;t be blank/)
      end
    end
  end
end