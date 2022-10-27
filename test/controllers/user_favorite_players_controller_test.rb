require "test_helper"

class UserFavoritePlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_favorite_player = user_favorite_players(:one)
  end

  test "should get index" do
    get user_favorite_players_url
    assert_response :success
  end

  test "should get new" do
    get new_user_favorite_player_url
    assert_response :success
  end

  test "should create user_favorite_player" do
    assert_difference("UserFavoritePlayer.count") do
      post user_favorite_players_url, params: { user_favorite_player: { player_id: @user_favorite_player.player_id, user_id: @user_favorite_player.user_id } }
    end

    assert_redirected_to user_favorite_player_url(UserFavoritePlayer.last)
  end

  test "should show user_favorite_player" do
    get user_favorite_player_url(@user_favorite_player)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_favorite_player_url(@user_favorite_player)
    assert_response :success
  end

  test "should update user_favorite_player" do
    patch user_favorite_player_url(@user_favorite_player), params: { user_favorite_player: { player_id: @user_favorite_player.player_id, user_id: @user_favorite_player.user_id } }
    assert_redirected_to user_favorite_player_url(@user_favorite_player)
  end

  test "should destroy user_favorite_player" do
    assert_difference("UserFavoritePlayer.count", -1) do
      delete user_favorite_player_url(@user_favorite_player)
    end

    assert_redirected_to user_favorite_players_url
  end
end
