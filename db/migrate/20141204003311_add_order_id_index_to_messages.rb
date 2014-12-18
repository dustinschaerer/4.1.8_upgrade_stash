class AddOrderIdIndexToMessages < ActiveRecord::Migration
  def change
    add_index :messages, :order_id
  end
end
