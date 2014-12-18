class RemoveProductIdFromLineItems < ActiveRecord::Migration
  def change
 	remove_column :line_items, :product_id
  end
end
