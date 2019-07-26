class CreateNurseryTables < ActiveRecord::Migration[5.2]
  def change
    create_table :nursery_tables do |t|
      t.integer :capacity
      t.references :zone, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
