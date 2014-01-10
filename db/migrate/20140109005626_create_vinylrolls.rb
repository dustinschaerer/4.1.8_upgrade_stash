class CreateVinylrolls < ActiveRecord::Migration
  def change
    create_table :vinylrolls do |t|
      t.integer :quantity
      t.references :series
      t.references :color
      t.integer :price

      t.timestamps
    end
  end
end
