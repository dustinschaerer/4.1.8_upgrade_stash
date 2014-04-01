require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products

  # A user goes to the index page. They select a product, adding it to their
  # cart, and check out, filling in their details on the checkout form. When
  # they submit, an order is created containing their information, along with a
  # single line item corresponding to the product they added to their cart.
  
  test "buying a product" do
    LineItem.delete_all
    Order.delete_all
    color_swatch = colors(:one)
    series_swatch = series(:two)

    get "/"
    assert_response :success
    assert_template "static_pages/home"
    
    xml_http_request :post, "/line_items?color_id=#{color_swatch.id}&series_id=#{sereis_swatch.id}"
    assert_response :success 
    
    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal color_swatch, cart.line_items[0].color
    
    get "/orders/new"
    assert_response :success
    assert_template "new"
    
    post_via_redirect "/orders",
                      order: { name:     "Tim Smith",
                               email:    "tim@example.org",
                               ship_street_address: "123 Way Street", 
                               ship_city: "Vancouver", 
                               ship_state: "Washington",
                               ship_country: "United States",
                               telephone: "555-555-5555" }
    assert_response :success
    assert_template "index"
    cart = Cart.find(session[:cart_id])
    assert_equal 0, cart.line_items.size
    
    orders = Order.all
    assert_equal 1, orders.size
    order = orders[0]
    
    assert_equal "Tim Smith",       order.name
    assert_equal "123 Way Street",  order.ship_street_address
    assert_equal "tim@example.org", order.email
    assert_equal "Vancouver",       order.ship_city
    
    assert_equal 1, order.line_items.size
    line_item = order.line_items[0]
    assert_equal color_swatch, line_item.color
    assert_equal series_swatch, line_item.series

    mail = ActionMailer::Base.deliveries.last
    assert_equal ["tim@example.org"], mail.to
    assert_equal 'staff@americo-test.us', mail[:from].value
    assert_equal "Americo Swatch Order Confirmation", mail.subject
  end
end