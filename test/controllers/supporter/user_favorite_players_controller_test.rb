require "test_helper"

class Supporter::UserFavoritePlayersControllerTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @user_favorite_player = user_favorite_players(:one)
  end

  test "should get JSON index" do    
    get supporter_favorite_players_url, as: :json
    assert_response :success
  end  

  test "should create supporter user_favorite_player" do
    assert_difference("UserFavoritePlayer.count") do
      post supporter_favorite_players_url, params: { 
        user_favorite_player: { 
          player_id: players(:one).id
        } 
      }, as: :json
    end
    assert_response :created
  end  

  test "should destroy supporter user_favorite_player" do
    assert_difference("UserFavoritePlayer.count", -1) do
      delete supporter_favorite_player_url(@user_favorite_player), as: :json
    end
    assert_response :success
  end
end
