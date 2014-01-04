class AddUserToOrders < ActiveRecord::Migration
  def change
  	add_reference :orders, :user, index: true, default: "1"
  end
end
