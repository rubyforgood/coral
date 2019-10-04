class AddDiscardedAtToZones < ActiveRecord::Migration[6.0]
  def change
    add_column :zones, :discarded_at, :datetime
    add_index :zones, :discarded_at
  end
end
