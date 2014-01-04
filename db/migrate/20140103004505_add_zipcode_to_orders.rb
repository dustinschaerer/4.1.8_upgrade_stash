class AddZipcodeToOrders < ActiveRecord::Migration
  def up
  	add_column :orders, :zipcode, :string, default: "null"
  end

  def down
  	remove_column :orders, :zipcode
  end
end
