json.array!(@purchases) do |purchase|
  json.extract! purchase, :user_id, :firstname, :lastname, :telephone, :contactby, :ship_street_address, :ship_city, :ship_state, :ship_zipcode, :ship_country, :pay_street_address, :pay_city, :pay_state, :pay_zipcode, :pay_country, :subtotal, :shipping, :sales_tax, :total, :pay_type
  json.url purchase_url(purchase, format: :json)
end