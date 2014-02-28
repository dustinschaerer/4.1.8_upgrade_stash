class CreateLaminatecuts < ActiveRecord::Migration
  def change
    create_table :laminatecuts do |t|
      t.integer :quantity
      t.integer :yards_long
      t.references :series, index: true
      t.references :color, index: true
      t.integer :price

      t.timestamps
    end
  end
end
