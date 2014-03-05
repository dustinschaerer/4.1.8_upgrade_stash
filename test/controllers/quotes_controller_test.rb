require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post :create, quote: { contactby: @quote.contactby, firstname: @quote.firstname, lastname: @quote.lastname, pay_city: @quote.pay_city, pay_country: @quote.pay_country, pay_state: @quote.pay_state, pay_street_address: @quote.pay_street_address, pay_type: @quote.pay_type, pay_zipcode: @quote.pay_zipcode, sales_tax: @quote.sales_tax, ship_city: @quote.ship_city, ship_country: @quote.ship_country, ship_state: @quote.ship_state, ship_street_address: @quote.ship_street_address, ship_zipcode: @quote.ship_zipcode, shipping: @quote.shipping, subtotal: @quote.subtotal, telephone: @quote.telephone, total: @quote.total, user_id: @quote.user_id }
    end

    assert_redirected_to quote_path(assigns(:quote))
  end

  test "should show quote" do
    get :show, id: @quote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quote
    assert_response :success
  end

  test "should update quote" do
    patch :update, id: @quote, quote: { contactby: @quote.contactby, firstname: @quote.firstname, lastname: @quote.lastname, pay_city: @quote.pay_city, pay_country: @quote.pay_country, pay_state: @quote.pay_state, pay_street_address: @quote.pay_street_address, pay_type: @quote.pay_type, pay_zipcode: @quote.pay_zipcode, sales_tax: @quote.sales_tax, ship_city: @quote.ship_city, ship_country: @quote.ship_country, ship_state: @quote.ship_state, ship_street_address: @quote.ship_street_address, ship_zipcode: @quote.ship_zipcode, shipping: @quote.shipping, subtotal: @quote.subtotal, telephone: @quote.telephone, total: @quote.total, user_id: @quote.user_id }
    assert_redirected_to quote_path(assigns(:quote))
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete :destroy, id: @quote
    end

    assert_redirected_to quotes_path
  end
end
