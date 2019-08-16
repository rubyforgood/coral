class CreateRestorationActivityLogEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :restoration_activity_log_entries do |t|
      t.boolean :cleaned
      t.integer :percent_filled
      t.integer :broken_corals
      t.integer :dead_corals
      t.integer :dive_id
      t.integer :nursery_table_id
      t.timestamps
    end
  end
end
