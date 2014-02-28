require 'test_helper'

class AmericlearsControllerTest < ActionController::TestCase
  setup do
    @americlear = americlears(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:americlears)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create americlear" do
    assert_difference('Americlear.count') do
      post :create, americlear: { price: @americlear.price, quantity: @americlear.quantity, wide: @americlear.wide, yards: @americlear.yards }
    end

    assert_redirected_to americlear_path(assigns(:americlear))
  end

  test "should show americlear" do
    get :show, id: @americlear
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @americlear
    assert_response :success
  end

  test "should update americlear" do
    patch :update, id: @americlear, americlear: { price: @americlear.price, quantity: @americlear.quantity, wide: @americlear.wide, yards: @americlear.yards }
    assert_redirected_to americlear_path(assigns(:americlear))
  end

  test "should destroy americlear" do
    assert_difference('Americlear.count', -1) do
      delete :destroy, id: @americlear
    end

    assert_redirected_to americlears_path
  end
end
