class CreateAmericlears < ActiveRecord::Migration
  def change
    create_table :americlears do |t|
      t.integer :quantity
      t.integer :yards
      t.integer :wide
      t.integer :price

      t.timestamps
    end
  end
end
