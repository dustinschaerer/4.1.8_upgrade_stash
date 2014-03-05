class DropDefaultFValuesInOrders < ActiveRecord::Migration
  def change
  	change_column_default :orders, :lastname, nil
  	change_column_default :orders, :user_id, nil
  	change_column_default :orders, :company, nil
  	change_column_default :orders, :zipcode, nil
  	change_column_default :orders, :status, nil
	change_column_default :orders, :contactby, nil
  end
end
