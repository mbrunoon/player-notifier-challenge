require "test_helper"

class Supporter::PlayersControllerTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @player = players(:one)
  end

  test "should get HTML index" do
    get supporter_players_url
    assert_response :success
  end
  
  test "should get JSON index" do
    get supporter_players_url, as: :json
    assert_response :success    
  end

  test "should show HTML player" do
    get supporter_player_url(@player)
    assert_response :success
  end

  test "should show JSON player" do
    get supporter_player_url(@player), as: :json
    assert_response :success
  end  
  
end
