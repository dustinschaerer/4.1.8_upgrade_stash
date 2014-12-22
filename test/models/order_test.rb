
require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  should have_many :line_items
  should belong_to :user
  should accept_nested_attributes_for :line_items
  should validate_presence_of(:user_id)
  should validate_presence_of(:firstname)
  should validate_presence_of(:lastname)
  should validate_presence_of(:street_address)
  should validate_presence_of(:city)
  should validate_presence_of(:state)
  should validate_presence_of(:zipcode)
  should validate_presence_of(:country)
  should validate_presence_of(:email)

   test "order attributes must not be empty" do
     order = Order.new
     assert order.invalid?, "Invalid order"
     assert order.errors[:firstname].any?, "No firstname"
     assert order.errors[:lastname].any?, "No lastname"
     assert order.errors[:street_address].any?, "No street address"
     assert order.errors[:city].any?, "No city"
     assert order.errors[:state].any?, "No state"
     assert order.errors[:country].any?, "No country"
     assert order.errors[:email].any?, "No email"
     assert order.errors[:zipcode].any?, "No zipcode"
   end

  #  test "image url is valid with correct URL" do
  #    order = Order.new(title:       "Vinyl Swatch Sample",
  #                          description: "8 x 10 Vinyl Swatch Sample",
  #                          category:    "Vinyl",
  #                          image_url:   "fred.gif",
  #                          thumbnail_url: "fred-thumb.gif" )
  #
  #   assert order.valid?, "fred.gif should be valid"
  #  end

  # test "the truth" do
  #   assert true
  # end
end
