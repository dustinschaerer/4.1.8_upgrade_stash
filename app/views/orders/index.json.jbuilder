json.array!(@orders) do |order|
  json.extract! order, :firstname, :lastname, :company, :street_address, :city, :zipcode, :state, :country, :email, :user_id, :status, :telephone, :email
  json.url order_url(order, format: :json)
end