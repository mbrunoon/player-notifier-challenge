require "test_helper"

class Supporter::NotificationsControllerTest < ActionDispatch::IntegrationTest
    
  include Devise::Test::IntegrationHelpers
  
  setup do        
    sign_in users(:one)
    @player = players(:one)
  end

  test "should get HTML index" do
    get supporter_notifications_url
    assert_response :success
  end

  test "should get JSON index" do
    get supporter_notifications_url, as: :json
    assert_response :success
  end

  test "should get new" do
    get new_supporter_notification_url
    assert_response :success
  end

  test "should create notification" do
    assert_difference("Notification.count") do
      post supporter_notifications_url, params: { notification: {
        message: "Message test",
        player_id: @player.id
        }
      }
    end
    assert_redirected_to supporter_notifications_url(Notification.last.user)
    
  end

  test "should create notification by JSON" do    
    assert_difference("Notification.count") do
      post supporter_notifications_url, params: { notification: {
        message: "Message test by json",
        player_id: @player.id
        }
      }, as: :json
    end
    assert_response :created
  end

end
