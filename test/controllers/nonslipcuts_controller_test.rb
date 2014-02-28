require 'test_helper'

class NonslipcutsControllerTest < ActionController::TestCase
  setup do
    @nonslipcut = nonslipcuts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nonslipcuts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nonslipcut" do
    assert_difference('Nonslipcut.count') do
      post :create, nonslipcut: { inches_long: @nonslipcut.inches_long, inches_wide: @nonslipcut.inches_wide, price: @nonslipcut.price, quantity: @nonslipcut.quantity }
    end

    assert_redirected_to nonslipcut_path(assigns(:nonslipcut))
  end

  test "should show nonslipcut" do
    get :show, id: @nonslipcut
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nonslipcut
    assert_response :success
  end

  test "should update nonslipcut" do
    patch :update, id: @nonslipcut, nonslipcut: { inches_long: @nonslipcut.inches_long, inches_wide: @nonslipcut.inches_wide, price: @nonslipcut.price, quantity: @nonslipcut.quantity }
    assert_redirected_to nonslipcut_path(assigns(:nonslipcut))
  end

  test "should destroy nonslipcut" do
    assert_difference('Nonslipcut.count', -1) do
      delete :destroy, id: @nonslipcut
    end

    assert_redirected_to nonslipcuts_path
  end
end
