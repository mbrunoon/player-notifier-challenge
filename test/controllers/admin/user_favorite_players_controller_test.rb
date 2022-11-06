require "test_helper"

class Admin::UserFavoritePlayersControllerTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers
  
  setup do
    sign_in users(:admin)
    @user_favorite_player = user_favorite_players(:one)
  end

  test "should get index" do
    get admin_favorite_players_url, as: :json
    assert_response :success
  end  

  test "should create JSON user_favorite_player" do    
    assert_difference("UserFavoritePlayer.count") do
      post admin_favorite_players_url, params: { user_favorite_player: { 
        player_id: players(:one).id,
        user_id: users(:one).id
      }}, as: :json      
    end

    assert_response :created
  end

  test "should show user_favorite_player" do
    get admin_favorite_player_url(@user_favorite_player), as: :json
    assert_response :success
  end  

  test "should update user_favorite_player" do
    patch admin_favorite_player_url(@user_favorite_player), params: { user_favorite_player: { 
      player_id: players(:two).id,
      user_id: users(:two).id
    }}, as: :json    
    assert_response :ok
  end

  test "should destroy JSON user_favorite_player" do
    assert_difference("UserFavoritePlayer.count", -1) do
      delete admin_favorite_player_url(@user_favorite_player), as: :json
    end
  end
end
