require 'test_helper'

class PurchasesControllerTest < ActionController::TestCase
  setup do
    @purchase = purchases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase" do
    assert_difference('Purchase.count') do
      post :create, purchase: { contactby: @purchase.contactby, firstname: @purchase.firstname, lastname: @purchase.lastname, pay_city: @purchase.pay_city, pay_country: @purchase.pay_country, pay_state: @purchase.pay_state, pay_street_address: @purchase.pay_street_address, pay_type: @purchase.pay_type, pay_zipcode: @purchase.pay_zipcode, sales_tax: @purchase.sales_tax, ship_city: @purchase.ship_city, ship_country: @purchase.ship_country, ship_state: @purchase.ship_state, ship_street_address: @purchase.ship_street_address, ship_zipcode: @purchase.ship_zipcode, shipping: @purchase.shipping, subtotal: @purchase.subtotal, telephone: @purchase.telephone, total: @purchase.total, user_id: @purchase.user_id }
    end

    assert_redirected_to purchase_path(assigns(:purchase))
  end

  test "should show purchase" do
    get :show, id: @purchase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase
    assert_response :success
  end

  test "should update purchase" do
    patch :update, id: @purchase, purchase: { contactby: @purchase.contactby, firstname: @purchase.firstname, lastname: @purchase.lastname, pay_city: @purchase.pay_city, pay_country: @purchase.pay_country, pay_state: @purchase.pay_state, pay_street_address: @purchase.pay_street_address, pay_type: @purchase.pay_type, pay_zipcode: @purchase.pay_zipcode, sales_tax: @purchase.sales_tax, ship_city: @purchase.ship_city, ship_country: @purchase.ship_country, ship_state: @purchase.ship_state, ship_street_address: @purchase.ship_street_address, ship_zipcode: @purchase.ship_zipcode, shipping: @purchase.shipping, subtotal: @purchase.subtotal, telephone: @purchase.telephone, total: @purchase.total, user_id: @purchase.user_id }
    assert_redirected_to purchase_path(assigns(:purchase))
  end

  test "should destroy purchase" do
    assert_difference('Purchase.count', -1) do
      delete :destroy, id: @purchase
    end

    assert_redirected_to purchases_path
  end
end
