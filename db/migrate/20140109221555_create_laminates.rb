class CreateLaminates < ActiveRecord::Migration
  def change
    create_table :laminates do |t|
      t.string :cover
      t.string :shape
      t.integer :width
      t.integer :length
      t.integer :height
      t.integer :drop
      t.references :series, index: true
      t.references :color, index: true
      t.boolean :umbrella
      t.boolean :velcro
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
