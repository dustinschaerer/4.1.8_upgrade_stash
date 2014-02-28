require 'test_helper'

class NonslippadsControllerTest < ActionController::TestCase
  setup do
    @nonslippad = nonslippads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nonslippads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nonslippad" do
    assert_difference('Nonslippad.count') do
      post :create, nonslippad: { price: @nonslippad.price, quantity: @nonslippad.quantity, width: @nonslippad.width }
    end

    assert_redirected_to nonslippad_path(assigns(:nonslippad))
  end

  test "should show nonslippad" do
    get :show, id: @nonslippad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nonslippad
    assert_response :success
  end

  test "should update nonslippad" do
    patch :update, id: @nonslippad, nonslippad: { price: @nonslippad.price, quantity: @nonslippad.quantity, width: @nonslippad.width }
    assert_redirected_to nonslippad_path(assigns(:nonslippad))
  end

  test "should destroy nonslippad" do
    assert_difference('Nonslippad.count', -1) do
      delete :destroy, id: @nonslippad
    end

    assert_redirected_to nonslippads_path
  end
end
