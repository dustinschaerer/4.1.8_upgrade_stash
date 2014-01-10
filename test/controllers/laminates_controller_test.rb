require 'test_helper'

class LaminatesControllerTest < ActionController::TestCase
  setup do
    @laminate = laminates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:laminates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create laminate" do
    assert_difference('Laminate.count') do
      post :create, laminate: { color_id: @laminate.color_id, cover: @laminate.cover, drop: @laminate.drop, height: @laminate.height, length: @laminate.length, price: @laminate.price, quantity: @laminate.quantity, series_id: @laminate.series_id, shape: @laminate.shape, umbrella: @laminate.umbrella, velcro: @laminate.velcro, width: @laminate.width }
    end

    assert_redirected_to laminate_path(assigns(:laminate))
  end

  test "should show laminate" do
    get :show, id: @laminate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @laminate
    assert_response :success
  end

  test "should update laminate" do
    patch :update, id: @laminate, laminate: { color_id: @laminate.color_id, cover: @laminate.cover, drop: @laminate.drop, height: @laminate.height, length: @laminate.length, price: @laminate.price, quantity: @laminate.quantity, series_id: @laminate.series_id, shape: @laminate.shape, umbrella: @laminate.umbrella, velcro: @laminate.velcro, width: @laminate.width }
    assert_redirected_to laminate_path(assigns(:laminate))
  end

  test "should destroy laminate" do
    assert_difference('Laminate.count', -1) do
      delete :destroy, id: @laminate
    end

    assert_redirected_to laminates_path
  end
end
