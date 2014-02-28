class CreateNonslipcuts < ActiveRecord::Migration
  def change
    create_table :nonslipcuts do |t|
      t.integer :quantity
      t.integer :inches_wide
      t.integer :inches_long
      t.integer :price

      t.timestamps
    end
  end
end
