require "test_helper"

class UserNotifierMailerTest < ActionMailer::TestCase
  
  test "email test" do
    notification = notifications(:one)
    email = UserNotifierMailer.send_player_read_notification(notification)
        
    assert_emails 1 do
      email.deliver_now
    end

  end

end
