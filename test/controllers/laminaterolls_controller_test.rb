require 'test_helper'

class LaminaterollsControllerTest < ActionController::TestCase
  setup do
    @laminateroll = laminaterolls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:laminaterolls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create laminateroll" do
    assert_difference('Laminateroll.count') do
      post :create, laminateroll: { color_id: @laminateroll.color_id, price: @laminateroll.price, quantity: @laminateroll.quantity, series_id: @laminateroll.series_id }
    end

    assert_redirected_to laminateroll_path(assigns(:laminateroll))
  end

  test "should show laminateroll" do
    get :show, id: @laminateroll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @laminateroll
    assert_response :success
  end

  test "should update laminateroll" do
    patch :update, id: @laminateroll, laminateroll: { color_id: @laminateroll.color_id, price: @laminateroll.price, quantity: @laminateroll.quantity, series_id: @laminateroll.series_id }
    assert_redirected_to laminateroll_path(assigns(:laminateroll))
  end

  test "should destroy laminateroll" do
    assert_difference('Laminateroll.count', -1) do
      delete :destroy, id: @laminateroll
    end

    assert_redirected_to laminaterolls_path
  end
end
