class AddCompanyToOrders < ActiveRecord::Migration
  def up
  	add_column :orders, :company, :string, default: "null"
  end

  def down
  	remove_column :orders, :company
  end
end
