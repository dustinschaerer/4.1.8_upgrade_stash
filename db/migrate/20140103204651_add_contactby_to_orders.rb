class AddContactbyToOrders < ActiveRecord::Migration
  def up
  	add_column :orders, :contactby, :string, default: "email"
  end

  def down
  	remove_column :orders, :contactby
  end
end