require 'test_helper'

class LaminatecutsControllerTest < ActionController::TestCase
  setup do
    @laminatecut = laminatecuts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:laminatecuts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create laminatecut" do
    assert_difference('Laminatecut.count') do
      post :create, laminatecut: { color_id: @laminatecut.color_id, price: @laminatecut.price, quantity: @laminatecut.quantity, series_id: @laminatecut.series_id, yards_long: @laminatecut.yards_long }
    end

    assert_redirected_to laminatecut_path(assigns(:laminatecut))
  end

  test "should show laminatecut" do
    get :show, id: @laminatecut
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @laminatecut
    assert_response :success
  end

  test "should update laminatecut" do
    patch :update, id: @laminatecut, laminatecut: { color_id: @laminatecut.color_id, price: @laminatecut.price, quantity: @laminatecut.quantity, series_id: @laminatecut.series_id, yards_long: @laminatecut.yards_long }
    assert_redirected_to laminatecut_path(assigns(:laminatecut))
  end

  test "should destroy laminatecut" do
    assert_difference('Laminatecut.count', -1) do
      delete :destroy, id: @laminatecut
    end

    assert_redirected_to laminatecuts_path
  end
end
