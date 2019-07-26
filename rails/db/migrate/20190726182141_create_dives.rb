class CreateDives < ActiveRecord::Migration[5.2]
  def change
    create_table :dives do |t|

      t.timestamps
    end
  end
end
