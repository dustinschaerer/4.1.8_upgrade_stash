class AddProductIdToStyles < ActiveRecord::Migration
  def change
  	add_column :styles, :product_id, :integer
    add_index :styles, :product_id
  end
end
