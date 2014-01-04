require 'test_helper'

class ShippingProfilesControllerTest < ActionController::TestCase
  setup do
    @shipping_profile = shipping_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipping_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipping_profile" do
    assert_difference('ShippingProfile.count') do
      post :create, shipping_profile: { city: @shipping_profile.city, company: @shipping_profile.company, country: @shipping_profile.country, firstname: @shipping_profile.firstname, lastname: @shipping_profile.lastname, state: @shipping_profile.state, street_address: @shipping_profile.street_address, user_id: @shipping_profile.user_id, zipcode: @shipping_profile.zipcode }
    end

    assert_redirected_to shipping_profile_path(assigns(:shipping_profile))
  end

  test "should show shipping_profile" do
    get :show, id: @shipping_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipping_profile
    assert_response :success
  end

  test "should update shipping_profile" do
    patch :update, id: @shipping_profile, shipping_profile: { city: @shipping_profile.city, company: @shipping_profile.company, country: @shipping_profile.country, firstname: @shipping_profile.firstname, lastname: @shipping_profile.lastname, state: @shipping_profile.state, street_address: @shipping_profile.street_address, user_id: @shipping_profile.user_id, zipcode: @shipping_profile.zipcode }
    assert_redirected_to shipping_profile_path(assigns(:shipping_profile))
  end

  test "should destroy shipping_profile" do
    assert_difference('ShippingProfile.count', -1) do
      delete :destroy, id: @shipping_profile
    end

    assert_redirected_to shipping_profiles_path
  end
end
