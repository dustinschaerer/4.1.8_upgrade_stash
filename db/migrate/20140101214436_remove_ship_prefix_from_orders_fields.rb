class RemoveShipPrefixFromOrdersFields < ActiveRecord::Migration
  def change
  	rename_column :orders, :ship_street_address, :street_address
  	rename_column :orders, :ship_city, :city
  	rename_column :orders, :ship_state, :state
  	rename_column :orders, :ship_country, :country
  end
end
