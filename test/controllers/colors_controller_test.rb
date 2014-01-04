require 'test_helper'

class ColorsControllerTest < ActionController::TestCase
  setup do
    @color = colors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create color" do
    assert_difference('Color.count') do
      post :create, color: { image_url: @color.image_url, name: @color.name, series_id: @color.series_id }
    end

    assert_redirected_to color_path(assigns(:color))
  end

  test "should show color" do
    get :show, id: @color
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @color
    assert_response :success
  end

  test "should update color" do
    patch :update, id: @color, color: { image_url: @color.image_url, name: @color.name, series_id: @color.series_id }
    assert_redirected_to color_path(assigns(:color))
  end

  test "should destroy color" do
    assert_difference('Color.count', -1) do
      delete :destroy, id: @color
    end

    assert_redirected_to colors_path
  end
end
