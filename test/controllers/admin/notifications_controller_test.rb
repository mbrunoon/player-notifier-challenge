require "test_helper"

class Admin::NotificationsControllerTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers
  
  setup do
    sign_in users(:admin)
    @notification = notifications(:one)
  end

  test "should get index" do
    get admin_notifications_url, as: :json
    assert_response :success
  end


  test "should create notification by JSON" do
    assert_difference("Notification.count") do
      post admin_notifications_url, params: { notification: { 
        user_id: users(:one).id,
        player_id: players(:one).id,
        message: "Test message"
      }}, as: :json
    end

    assert_response :created
  end  


  test "should update JSON notification" do
    patch admin_notification_url(@notification), params: { notification: { 
      player_id: players(:two).id,
      message: "Updated message"
    }}, as: :json
    assert_response :ok
  end

  test "should destroy notification JSON" do
    assert_difference("Notification.count", -1) do
      delete admin_notification_url(@notification)
    end    
  end
end
