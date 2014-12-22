require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  should have_many :lines
  should belong_to :user

  should accept_nested_attributes_for :lines
  should validate_presence_of(:user_id)

  should validate_presence_of(:firstname)
  should validate_presence_of(:lastname)
  should validate_presence_of(:telephone)
  should validate_presence_of(:contactby)
  should validate_presence_of(:ship_street_address)
  should validate_presence_of(:ship_city)
  should validate_presence_of(:ship_state)
  should validate_presence_of(:ship_zipcode)
  should validate_presence_of(:ship_country)
  should validate_presence_of(:subtotal)
  should validate_presence_of(:shipping)
  should validate_presence_of(:sales_tax)
  should validate_presence_of(:total)
  should validate_presence_of(:pay_type)
end
