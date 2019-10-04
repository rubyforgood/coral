class AddDiscardedAtToDives < ActiveRecord::Migration[6.0]
  def change
    add_column :dives, :discarded_at, :datetime
    add_index :dives, :discarded_at
  end
end
