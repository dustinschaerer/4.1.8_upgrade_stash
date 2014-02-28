require 'test_helper'

class VinylcutsControllerTest < ActionController::TestCase
  setup do
    @vinylcut = vinylcuts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vinylcuts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vinylcut" do
    assert_difference('Vinylcut.count') do
      post :create, vinylcut: { color_id: @vinylcut.color_id, price: @vinylcut.price, quantity: @vinylcut.quantity, series_id: @vinylcut.series_id, yards_long: @vinylcut.yards_long }
    end

    assert_redirected_to vinylcut_path(assigns(:vinylcut))
  end

  test "should show vinylcut" do
    get :show, id: @vinylcut
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vinylcut
    assert_response :success
  end

  test "should update vinylcut" do
    patch :update, id: @vinylcut, vinylcut: { color_id: @vinylcut.color_id, price: @vinylcut.price, quantity: @vinylcut.quantity, series_id: @vinylcut.series_id, yards_long: @vinylcut.yards_long }
    assert_redirected_to vinylcut_path(assigns(:vinylcut))
  end

  test "should destroy vinylcut" do
    assert_difference('Vinylcut.count', -1) do
      delete :destroy, id: @vinylcut
    end

    assert_redirected_to vinylcuts_path
  end
end
