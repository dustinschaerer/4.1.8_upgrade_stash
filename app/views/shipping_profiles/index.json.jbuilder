json.array!(@shipping_profiles) do |shipping_profile|
  json.extract! shipping_profile, :user_id, :firstname, :lastname, :company, :street_address, :city, :state, :zipcode, :country
  json.url shipping_profile_url(shipping_profile, format: :json)
end