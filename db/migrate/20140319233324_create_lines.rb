class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.references :quote_product, index: true
      t.integer :length
      t.integer :width
      t.integer :height
      t.references :cover, index: true
      t.references :series, index: true
      t.references :color, index: true
      t.references :shape, index: true
      t.boolean :umbrella
      t.boolean :velcro
      t.integer :yards
      t.references :size, index: true
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
