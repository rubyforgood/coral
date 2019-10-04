class AddDiscardedAtToRestorationActivityLogEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :restoration_activity_log_entries, :discarded_at, :datetime
    add_index :restoration_activity_log_entries, :discarded_at
  end
end
