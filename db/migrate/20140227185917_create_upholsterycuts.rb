class CreateUpholsterycuts < ActiveRecord::Migration
  def change
    create_table :upholsterycuts do |t|
      t.integer :quantity
      t.references :series, index: true
      t.references :color, index: true
      t.integer :price
      t.integer :yards_long

      t.timestamps
    end
  end
end
