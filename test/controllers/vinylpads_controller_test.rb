require 'test_helper'

class VinylpadsControllerTest < ActionController::TestCase
  setup do
    @vinylpad = vinylpads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vinylpads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vinylpad" do
    assert_difference('Vinylpad.count') do
      post :create, vinylpad: { price: @vinylpad.price, quantity: @vinylpad.quantity }
    end

    assert_redirected_to vinylpad_path(assigns(:vinylpad))
  end

  test "should show vinylpad" do
    get :show, id: @vinylpad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vinylpad
    assert_response :success
  end

  test "should update vinylpad" do
    patch :update, id: @vinylpad, vinylpad: { price: @vinylpad.price, quantity: @vinylpad.quantity }
    assert_redirected_to vinylpad_path(assigns(:vinylpad))
  end

  test "should destroy vinylpad" do
    assert_difference('Vinylpad.count', -1) do
      delete :destroy, id: @vinylpad
    end

    assert_redirected_to vinylpads_path
  end
end
