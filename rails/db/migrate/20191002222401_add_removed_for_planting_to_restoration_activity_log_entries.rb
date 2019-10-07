class AddRemovedForPlantingToRestorationActivityLogEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :restoration_activity_log_entries, :removed_for_planting, :integer
  end
end
