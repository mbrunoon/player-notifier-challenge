require "test_helper"
require 'devise/jwt/test_helpers'
require 'bcrypt'

class UserJwtTest < ActionDispatch::IntegrationTest  

  test 'User login JWT' do
    user = { user: { email: "one@one.com", password: "123456789!" } }
    post user_session_url, params: user, as: :json
    
    assert_response :success
  end

  test 'User not found login attempt' do
    user = { user: { email: "user@notfound.com", password: "123456789!" } }    
    post user_session_url, params: user, as: :json    
    
    assert_response :unprocessable_entity
  end

  test 'Create a User already taken' do
    new_user = { user: { email: "one@one.com", password: "123456789!", name: "New User" } }        
    post user_registration_url, params: new_user, as: :json
    
    assert_response :unprocessable_entity
  end

  test "User Sign out" do
    user = { user: { email: "one@one.com", password: "123456789!" } }
    post user_session_url, params: user, as: :json    
    assert_response :success

    bearer_token = JSON.parse(response.body)["user"]["token"]    

    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{bearer_token}" }    

    delete destroy_user_session_url, headers: headers
    assert_response :success
  end

end
