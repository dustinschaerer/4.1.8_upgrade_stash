=begin
require 'test_helper'

class QuotecartsControllerTest < ActionController::TestCase
  setup do
    @quotecart = quotecarts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quotecarts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quotecart" do
    assert_difference('Quotecart.count') do
      post :create, quotecart: {  }
    end

    assert_redirected_to quotecart_path(assigns(:quotecart))
  end

  test "should show quotecart" do
    get :show, id: @quotecart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quotecart
    assert_response :success
  end

  test "should update quotecart" do
    patch :update, id: @quotecart, quotecart: {  }
    assert_redirected_to quotecart_path(assigns(:quotecart))
  end

  test "should destroy quotecart" do
    assert_difference('Quotecart.count', -1) do
      session[:quotecart_id] = @quotecart.id
      delete :destroy, id: @quotecart
    end

    assert_redirected_to quotecarts_path
  end
end
=end
