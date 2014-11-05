require 'test_helper'

class PlayerProfilesControllerTest < ActionController::TestCase
  setup do
    @player_profile = player_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_profile" do
    assert_difference('PlayerProfile.count') do
      post :create, player_profile: {  }
    end

    assert_redirected_to player_profile_path(assigns(:player_profile))
  end

  test "should show player_profile" do
    get :show, id: @player_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player_profile
    assert_response :success
  end

  test "should update player_profile" do
    patch :update, id: @player_profile, player_profile: {  }
    assert_redirected_to player_profile_path(assigns(:player_profile))
  end

  test "should destroy player_profile" do
    assert_difference('PlayerProfile.count', -1) do
      delete :destroy, id: @player_profile
    end

    assert_redirected_to player_profiles_path
  end
end
