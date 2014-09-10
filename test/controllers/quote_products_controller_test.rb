require 'test_helper'

class QuoteProductsControllerTest < ActionController::TestCase
  

=begin
  setup do
    @quote_product = quote_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quote_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quote_product" do
    assert_difference('QuoteProduct.count') do
      post :create, quote_product: { group: @quote_product.group, name: @quote_product.name }
    end

    assert_redirected_to quote_product_path(assigns(:quote_product))
  end

  test "should show quote_product" do
    get :show, id: @quote_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quote_product
    assert_response :success
  end

  test "should update quote_product" do
    patch :update, id: @quote_product, quote_product: { group: @quote_product.group, name: @quote_product.name }
    assert_redirected_to quote_product_path(assigns(:quote_product))
  end

  test "should destroy quote_product" do
    assert_difference('QuoteProduct.count', -1) do
      delete :destroy, id: @quote_product
    end

    assert_redirected_to quote_products_path
  end
=end

end
