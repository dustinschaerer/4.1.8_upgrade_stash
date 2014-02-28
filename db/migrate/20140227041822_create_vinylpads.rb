class CreateVinylpads < ActiveRecord::Migration
  def change
    create_table :vinylpads do |t|
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
