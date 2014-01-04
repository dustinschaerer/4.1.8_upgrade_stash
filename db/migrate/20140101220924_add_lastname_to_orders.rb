class AddLastnameToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :lastname, :string, default: "null"
  end
end
