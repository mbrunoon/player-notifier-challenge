require "test_helper"

class Supporter::PlayersControllerTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @player = players(:one)
  end
  
  test "should get JSON index" do
    get supporter_players_url, as: :json
    assert_response :success    
  end    
  
end
