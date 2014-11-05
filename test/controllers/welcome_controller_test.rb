require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get start_game" do
    get :start_game
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get start_game_with_player" do
    get :start_game_with_player
    assert_response :success
  end

end
