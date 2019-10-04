class AddDiscardedAtToNurseryTables < ActiveRecord::Migration[6.0]
  def change
    add_column :nursery_tables, :discarded_at, :datetime
    add_index :nursery_tables, :discarded_at
  end
end
