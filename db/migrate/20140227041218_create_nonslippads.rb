class CreateNonslippads < ActiveRecord::Migration
  def change
    create_table :nonslippads do |t|
      t.integer :quantity
      t.string :width
      t.integer :price

      t.timestamps
    end
  end
end
