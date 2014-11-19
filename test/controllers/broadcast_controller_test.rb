require 'test_helper'

class BroadcastControllerTest < ActionController::TestCase
  test "should get broadcast" do
    get :broadcast
    assert_response :success
  end

  test "should get message" do
    get :message
    assert_response :success
  end

end
