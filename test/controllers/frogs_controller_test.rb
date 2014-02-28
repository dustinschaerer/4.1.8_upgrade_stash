require 'test_helper'

class FrogsControllerTest < ActionController::TestCase
  setup do
    @frog = frogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frog" do
    assert_difference('Frog.count') do
      post :create, frog: { name: @frog.name, size: @frog.size }
    end

    assert_redirected_to frog_path(assigns(:frog))
  end

  test "should show frog" do
    get :show, id: @frog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @frog
    assert_response :success
  end

  test "should update frog" do
    patch :update, id: @frog, frog: { name: @frog.name, size: @frog.size }
    assert_redirected_to frog_path(assigns(:frog))
  end

  test "should destroy frog" do
    assert_difference('Frog.count', -1) do
      delete :destroy, id: @frog
    end

    assert_redirected_to frogs_path
  end
end
