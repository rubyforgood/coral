class RenamePercentFilledColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :restoration_activity_log_entries, :percent_filled, :corals_added
  end
end
