require "test_helper"
require 'devise/jwt/test_helpers'

class UserFavoritePlayersControllerTest < ActionDispatch::IntegrationTest
  
  test 'Login JWT' do

    user = users(:one)
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
    puts auth_headers

    post user_session_url, headers: auth_headers
    puts "RESPONSE: "
    puts response.content_type
    puts response.parsed_body
    assert_response :success
    
    delete destroy_user_session, headers: auth_headers

  end

end
