require "rails_helper"

RSpec.describe RestorationActivityLogEntry do
  log = FactoryBot.build(:restoration_activity_log_entry)
  table = FactoryBot.build(:nursery_table)

  def attach_jpeg_images(log, filenames)
    fixture_path = Rails.root.join("spec", "factories", "images")

    attachments = filenames.map { |n| "#{n}.JPG" }.map do |name|
      { io: File.open(fixture_path.join(name)),
        filename: name,
        content_type: "image/jpeg" }
    end

    log.images.attach(attachments)
  end

  describe "#images" do
    it "starts out empty" do
      expect(log.images).to be_empty
    end

    it "accepts multiple images" do
      attach_jpeg_images(log, %w[GOPR3892 GOPR3893 GOPR3894 GOPR3895
                                 GOPR3896 GOPR3900 GOPR3901 GOPR3902])

      expect(log.images.size).to eq 8
    end
  end

  describe "table_name" do
    it "is Unassigned if no nursery table present" do
      expect(log.table_name).to eq("Unassigned")
    end

    it "is nursery table name if available" do
      log.nursery_table = table

      expect(log.table_name).to eq(table.name)
    end
  end
end
