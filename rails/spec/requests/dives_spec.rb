require "rails_helper"
require "support/authentication"

RSpec.describe "Dives", type: :request, focus: true do
  include_context "logged in"
  describe "GET show" do
    let!(:dive) { FactoryBot.create(:dive) }

    it "renders the dive hub" do
      locale_path_prefixes.each do |locale|
        get "#{locale}/dives/#{dive.id}"
        expect(response).to be_successful
      end
    end
  end

  describe "GET new" do
    it "succeeds" do
      locale_path_prefixes.each do |locale|
        get "#{locale}/dives/new"
        expect(response).to be_successful
      end
    end
  end

  describe "POST create" do
    context "given a complete checklist" do
      subject do
        lambda { |locale|
          post_path = "#{locale}/dives"
          post post_path, params: { dive: { i_have_been_responsible: 1 } }
        }
      end

      it "redirects to the dive page" do
        locale_path_prefixes.each do |locale|
          subject.call(locale)
          expect(response).to be_redirect

          follow_redirect!
          expect(response).to be_successful
        end
      end

      it "creates the dive" do
        locale_path_prefixes.each do |locale|
          expect { subject.call(locale) }.to change { Dive.count }.by(1)
        end
      end
    end

    context "given an incomplete checklist" do
      subject do
        lambda { |locale|
          post "#{locale}/dives", params: { dive: { i_have_been_responsible: nil } }
        }
      end

      it "does not create the dive" do
        locale_path_prefixes.each do |locale|
          expect { subject.call(locale) }.not_to change(Dive, :count)
        end
      end

      it "renders an error page" do
        locale_path_prefixes.each do |locale|
          subject.call(locale)
          expect(response.body).to match(/can&#39;t be blank/)
        end
      end
    end
  end

  describe "POST finish" do
    let!(:dive) { FactoryBot.create(:dive) }

    subject do
      lambda { |locale|
        post "/dives/#{dive.id}/finish"
      }
    end

    it "redirects to the dive page" do
      locale_path_prefixes.each do |locale|
        subject.call(locale)
        expect(response).to be_redirect

        follow_redirect!
        expect(response).to be_successful
      end
    end

    it "marks the dive as finished" do
      locale_path_prefixes.each do |locale|
        subject.call(locale)

        dive.reload
        follow_redirect!
        expect(dive.finished_at).not_to be_nil
      end
    end
  end
end
