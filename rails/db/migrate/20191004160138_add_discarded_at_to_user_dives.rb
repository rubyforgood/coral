class AddDiscardedAtToUserDives < ActiveRecord::Migration[6.0]
  def change
    add_column :user_dives, :discarded_at, :datetime
    add_index :user_dives, :discarded_at
  end
end
