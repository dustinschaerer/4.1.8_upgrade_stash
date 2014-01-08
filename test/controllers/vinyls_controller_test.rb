require 'test_helper'

class VinylsControllerTest < ActionController::TestCase
  setup do
    @vinyl = vinyls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vinyls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vinyl" do
    assert_difference('Vinyl.count') do
      post :create, vinyl: { color_id: @vinyl.color_id, cover: @vinyl.cover, drop: @vinyl.drop, height: @vinyl.height, length: @vinyl.length, price: @vinyl.price, quantity: @vinyl.quantity, series_id: @vinyl.series_id, shape: @vinyl.shape, umbrella: @vinyl.umbrella, velcro: @vinyl.velcro, width: @vinyl.width }
    end

    assert_redirected_to vinyl_path(assigns(:vinyl))
  end

  test "should show vinyl" do
    get :show, id: @vinyl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vinyl
    assert_response :success
  end

  test "should update vinyl" do
    patch :update, id: @vinyl, vinyl: { color_id: @vinyl.color_id, cover: @vinyl.cover, drop: @vinyl.drop, height: @vinyl.height, length: @vinyl.length, price: @vinyl.price, quantity: @vinyl.quantity, series_id: @vinyl.series_id, shape: @vinyl.shape, umbrella: @vinyl.umbrella, velcro: @vinyl.velcro, width: @vinyl.width }
    assert_redirected_to vinyl_path(assigns(:vinyl))
  end

  test "should destroy vinyl" do
    assert_difference('Vinyl.count', -1) do
      delete :destroy, id: @vinyl
    end

    assert_redirected_to vinyls_path
  end
end
