json.array!(@quotes) do |quote|
  json.extract! quote, :user_id, :firstname, :lastname, :telephone, :contactby, :ship_street_address, :ship_city, :ship_state, :ship_zipcode, :ship_country, :subtotal, :shipping, :sales_tax, :total, :pay_type
  json.url quote_url(quote, format: :json)
end