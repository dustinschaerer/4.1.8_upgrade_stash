class AddStatusToOrders < ActiveRecord::Migration
  def up
  	add_column :orders, :status, :string, default: "submitted"
  end

   def down
  	remove_column :orders, :status
  end
end
