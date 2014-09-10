require 'test_helper'

class QuoteholdersControllerTest < ActionController::TestCase

=begin 
  setup do
    @quoteholder = quoteholders(:one)
  end

  test "should show quoteholder" do
    get :show, id: @quoteholder
    assert_response :success
  end

  test "should destroy quoteholder" do
    assert_difference('Quoteholder.count', -1) do
      delete :destroy, id: @quoteholder
    end

    assert_redirected_to quoteholders_path
  end


  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quoteholders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quoteholder" do
    assert_difference('Quoteholder.count') do
      post :create, quoteholder: {  }
    end

    assert_redirected_to quoteholder_path(assigns(:quoteholder))
  end

  test "should get edit" do
    get :edit, id: @quoteholder
    assert_response :success
  end

  test "should update quoteholder" do
    patch :update, id: @quoteholder, quoteholder: {  }
    assert_redirected_to quoteholder_path(assigns(:quoteholder))
  end
=end

end
