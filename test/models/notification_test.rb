require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  
  test "Listing not deleted Notifications" do
    notifications = Notification.all
    deleted_message = notifications(:deleted)
    refute_includes(notifications, deleted_message, "Deleted messages should not be listed")
  end

end
