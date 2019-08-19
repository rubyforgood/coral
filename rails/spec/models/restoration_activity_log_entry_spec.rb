require "rails_helper"

RSpec.describe RestorationActivityLogEntry do
  log = FactoryBot.build(:restoration_activity_log_entry)
  table = FactoryBot.build(:nursery_table)

  def attach_jpeg_image(log, filename)
    log.images.attach(
      io: File.open(
        Rails.root.join("spec", "factories", "images", filename)
      ),
      filename: filename,
      content_type: "image/jpeg"
    )
  end

  describe "#images" do
    it "starts out empty" do
      expect(log.images).to be_empty
    end

    it "accepts multiple images" do
      attach_jpeg_image(log, "GOPR3892.JPG")
      attach_jpeg_image(log, "GOPR3893.JPG")
      attach_jpeg_image(log, "GOPR3894.JPG")
      attach_jpeg_image(log, "GOPR3895.JPG")
      attach_jpeg_image(log, "GOPR3896.JPG")
      attach_jpeg_image(log, "GOPR3900.JPG")
      attach_jpeg_image(log, "GOPR3901.JPG")
      attach_jpeg_image(log, "GOPR3902.JPG")
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
