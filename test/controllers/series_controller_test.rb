require 'test_helper'

class SeriesControllerTest < ActionController::TestCase

=begin
  setup do
    @series = series(:series_one)
  end

  test "should show series" do
    get :show, id: @series
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:series)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create series" do
    assert_difference('Series.count') do
      post :create, series: { description: @series.description, image_url: @series.image_url, name: @series.name, style_id: @series.style_id }
    end

    assert_redirected_to series_path(assigns(:series))
  end


  test "should get edit" do
    get :edit, id: @series
    assert_response :success
  end

  test "should update series" do
    patch :update, id: @series, series: { description: @series.description, image_url: @series.image_url, name: @series.name, style_id: @series.style_id }
    assert_redirected_to series_path(assigns(:series))
  end

  test "should destroy series" do
    assert_difference('Series.count', -1) do
      delete :destroy, id: @series
    end

    assert_redirected_to series_index_path
  end
=end

end
