class AddFinishedAtToDives < ActiveRecord::Migration[5.2]
  def change
    add_column :dives, :finished_at, :timestamp
  end
end
