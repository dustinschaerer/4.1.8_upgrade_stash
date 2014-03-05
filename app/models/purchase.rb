class Purchase < ActiveRecord::Base
  belongs_to :user


  validate :user_id, :firstname, :lastname, :telephone, :contactby, :pay_type
  validate :ship_street_address, :ship_city, :ship_state, :ship_zipcode, :ship_country
  validate :pay_street_address, :pay_city, :pay_state, :pay_zipcode, :pay_country
end
