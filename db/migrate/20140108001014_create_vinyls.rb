class CreateVinyls < ActiveRecord::Migration
  def change
    create_table :vinyls do |t|
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
      t.integer :price, :default => "0"

      t.timestamps
    end
  end
end
