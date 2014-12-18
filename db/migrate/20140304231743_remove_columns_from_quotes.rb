class RemoveColumnsFromQuotes < ActiveRecord::Migration

	def change
  		remove_column :quotes, :pay_street_address
  		remove_column :quotes, :pay_city
  		remove_column :quotes, :pay_state
  		remove_column :quotes, :pay_zipcode
  		remove_column :quotes, :pay_country
	end

end

