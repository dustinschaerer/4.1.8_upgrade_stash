require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @message = messages(:message_one)
  end


  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post :create, message: { email: @message.email, name: @message.name, order_id: @message.order_id, phone: @message.phone, quote_id: @message.quote_id, reason: @message.reason, message: @message.message }
    end

    assert_redirected_to message_path(assigns(:message))
  end

 
end
