class RenameRestorationColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :restoration_activity_log_entries, :bleached_corals, :bleached_corals
  end
end