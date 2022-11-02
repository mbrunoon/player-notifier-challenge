require "test_helper"

class Admin::TriggerControllerTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)    
  end

  test "mark notification as read" do
    notification = notifications(:one)
    patch admin_trigger_notification_path(notification), as: :json    
    assert_response :ok    
    assert_not_nil response.body["read_at"]
  end


end
