require "rails_helper"
require "support/authentication"

RSpec.describe "Restoration Activity Log", type: :request do
  include_context "logged in"
  describe "GET show" do
    let!(:zone) { FactoryBot.create(:zone) }
    let!(:nursery_table) { FactoryBot.create(:nursery_table, zone_id: zone.id) }
    let!(:log_entry) { FactoryBot.create(:restoration_activity_log_entry, nursery_table_id: nursery_table.id) }

    it "renders" do
      get "/restoration_activity_log_entries/#{log_entry.id}"

      expect(response).to be_successful
    end
  end

  describe "GET new" do
    it "succeeds" do
      get "/restoration_activity_log_entries/new"

      expect(response).to be_successful
    end
  end

  describe "POST create" do
    let!(:zone) { FactoryBot.create(:zone) }
    let!(:nursery_table) { FactoryBot.create(:nursery_table, zone_id: zone.id) }

    context "given images" do
      subject do
        lambda {
          post "/restoration_activity_log_entries", params: {
            restoration_activity_log_entry: {
              images: images,
              nursery_table_id: nursery_table.id
            }
          }
        }
      end

      let(:images) do
        [
          fixture_file_upload(Rails.root.join("spec", "factories", "images", "GOPR3892.JPG")),
          fixture_file_upload(Rails.root.join("spec", "factories", "images", "GOPR3893.JPG"))
        ]
      end

      it "redirects to another page" do
        subject.call
        expect(response).to be_redirect

        follow_redirect!
        expect(response).to be_successful
      end

      context "given a dive identifier" do
        it "redirects to the dive page" do
          post "/restoration_activity_log_entries", params: {
            restoration_activity_log_entry: { dive_id: 33 }
          }

          expect(response).to redirect_to dive_path(33)
        end
      end

      it "adds a log entry" do
        expect { subject.call }.to change { RestorationActivityLogEntry.count }.by(1)
      end
    end

    describe "PUT update" do
      context "given images" do
        subject do
          lambda {
            put "/restoration_activity_log_entries/#{log_entry.id}", params: {
              restoration_activity_log_entry: {
                images: images,
                nursery_table_id: nursery_table.id
              }
            }
          }
        end

        let!(:log_entry) { FactoryBot.create(:restoration_activity_log_entry) }

        let(:images) do
          [
            fixture_file_upload(Rails.root.join("spec", "factories", "images", "GOPR3892.JPG")),
            fixture_file_upload(Rails.root.join("spec", "factories", "images", "GOPR3893.JPG"))
          ]
        end

        it "redirects to another page" do
          subject.call
          expect(response).to be_redirect

          follow_redirect!
          expect(response).to be_successful
        end

        it "adds images" do
          expect { subject.call }.to change { log_entry.images.count }.by(2)
        end
      end
    end
  end
end
