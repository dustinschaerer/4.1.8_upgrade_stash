require 'test_helper'

class VinylrollsControllerTest < ActionController::TestCase
  setup do
    @vinylroll = vinylrolls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vinylrolls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vinylroll" do
    assert_difference('Vinylroll.count') do
      post :create, vinylroll: { price: @vinylroll.price, quantity: @vinylroll.quantity, references: @vinylroll.references, references: @vinylroll.references }
    end

    assert_redirected_to vinylroll_path(assigns(:vinylroll))
  end

  test "should show vinylroll" do
    get :show, id: @vinylroll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vinylroll
    assert_response :success
  end

  test "should update vinylroll" do
    patch :update, id: @vinylroll, vinylroll: { price: @vinylroll.price, quantity: @vinylroll.quantity, references: @vinylroll.references, references: @vinylroll.references }
    assert_redirected_to vinylroll_path(assigns(:vinylroll))
  end

  test "should destroy vinylroll" do
    assert_difference('Vinylroll.count', -1) do
      delete :destroy, id: @vinylroll
    end

    assert_redirected_to vinylrolls_path
  end
end
