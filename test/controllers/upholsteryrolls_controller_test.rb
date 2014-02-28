require 'test_helper'

class UpholsteryrollsControllerTest < ActionController::TestCase
  setup do
    @upholsteryroll = upholsteryrolls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:upholsteryrolls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create upholsteryroll" do
    assert_difference('Upholsteryroll.count') do
      post :create, upholsteryroll: { color_id: @upholsteryroll.color_id, price: @upholsteryroll.price, quantity: @upholsteryroll.quantity, series_id: @upholsteryroll.series_id }
    end

    assert_redirected_to upholsteryroll_path(assigns(:upholsteryroll))
  end

  test "should show upholsteryroll" do
    get :show, id: @upholsteryroll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @upholsteryroll
    assert_response :success
  end

  test "should update upholsteryroll" do
    patch :update, id: @upholsteryroll, upholsteryroll: { color_id: @upholsteryroll.color_id, price: @upholsteryroll.price, quantity: @upholsteryroll.quantity, series_id: @upholsteryroll.series_id }
    assert_redirected_to upholsteryroll_path(assigns(:upholsteryroll))
  end

  test "should destroy upholsteryroll" do
    assert_difference('Upholsteryroll.count', -1) do
      delete :destroy, id: @upholsteryroll
    end

    assert_redirected_to upholsteryrolls_path
  end
end
