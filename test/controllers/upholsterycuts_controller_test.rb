require 'test_helper'

class UpholsterycutsControllerTest < ActionController::TestCase
  setup do
    @upholsterycut = upholsterycuts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:upholsterycuts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create upholsterycut" do
    assert_difference('Upholsterycut.count') do
      post :create, upholsterycut: { color_id: @upholsterycut.color_id, price: @upholsterycut.price, quantity: @upholsterycut.quantity, series_id: @upholsterycut.series_id, yards_long: @upholsterycut.yards_long }
    end

    assert_redirected_to upholsterycut_path(assigns(:upholsterycut))
  end

  test "should show upholsterycut" do
    get :show, id: @upholsterycut
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @upholsterycut
    assert_response :success
  end

  test "should update upholsterycut" do
    patch :update, id: @upholsterycut, upholsterycut: { color_id: @upholsterycut.color_id, price: @upholsterycut.price, quantity: @upholsterycut.quantity, series_id: @upholsterycut.series_id, yards_long: @upholsterycut.yards_long }
    assert_redirected_to upholsterycut_path(assigns(:upholsterycut))
  end

  test "should destroy upholsterycut" do
    assert_difference('Upholsterycut.count', -1) do
      delete :destroy, id: @upholsterycut
    end

    assert_redirected_to upholsterycuts_path
  end
end
