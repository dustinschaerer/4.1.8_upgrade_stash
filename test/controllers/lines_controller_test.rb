require 'test_helper'

class LinesControllerTest < ActionController::TestCase
 
=begin  
  setup do
    @line = lines(:one)
    @qp = quote_products(:quote_product_one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line" do
    assert_difference('Line.count') do
      post :create, line: { color_id: @line.color_id, cover_id: @line.cover_id, height: @line.height, length: @line.length, price: @line.price, quantity: @line.quantity, quote_product_id: @line.quote_product_id, series_id: @line.series_id, shape_id: @line.shape_id, size_id: @line.size_id, umbrella: @line.umbrella, velcro: @line.velcro, width: @line.width, yards: @line.yards }
    end

    assert_redirected_to line_path(assigns(:line))
  end
  
  test "should destroy line" do
    assert_difference('Line.count', -1) do
      delete :destroy, id: @line
    end

    assert_redirected_to lines_path
  end

  

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lines)
  end
  
  test "should show line" do
    get :show, id: @line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line
    assert_response :success
  end

  test "should update line" do
    patch :update, id: @line, line: { color_id: @line.color_id, cover_id: @line.cover_id, height: @line.height, length: @line.length, price: @line.price, quantity: @line.quantity, quote_product_id: @line.quote_product_id, series_id: @line.series_id, shape_id: @line.shape_id, size_id: @line.size_id, umbrella: @line.umbrella, velcro: @line.velcro, width: @line.width, yards: @line.yards }
    assert_redirected_to line_path(assigns(:line))
  end
=end

end