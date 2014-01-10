class CreateLaminaterolls < ActiveRecord::Migration
  def change
    create_table :laminaterolls do |t|
      t.integer :quantity
      t.references :series, index: true
      t.references :color, index: true
      t.integer :price

      t.timestamps
    end
  end
end
