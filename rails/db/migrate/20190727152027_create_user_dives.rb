class CreateUserDives < ActiveRecord::Migration[5.2]
  def change
    create_table :user_dives do |t|
      t.integer :user_id
      t.integer :dive_id
      t.timestamps
    end
  end
end
