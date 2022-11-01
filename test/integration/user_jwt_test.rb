require "test_helper"
require 'devise/jwt/test_helpers'

class UserJwtTest < ActionDispatch::IntegrationTest
  
  test 'User login JWT' do

    user = users(:one)
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)

    post user_session_url, headers: auth_headers
    assert_response :success
    
    # delete destroy_user_session, headers: auth_headers

  end


end
