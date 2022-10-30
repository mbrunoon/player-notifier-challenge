require "application_system_test_case"

class Supporter::NotificationsTest < ApplicationSystemTestCase
  setup do
    @supporter_notification = supporter_notifications(:one)
  end

  test "visiting the index" do
    visit supporter_notifications_url
    assert_selector "h1", text: "Notifications"
  end

  test "should create notification" do
    visit supporter_notifications_url
    click_on "New notification"

    fill_in "Index", with: @supporter_notification.index
    fill_in "Show", with: @supporter_notification.show
    click_on "Create Notification"

    assert_text "Notification was successfully created"
    click_on "Back"
  end

  test "should update Notification" do
    visit supporter_notification_url(@supporter_notification)
    click_on "Edit this notification", match: :first

    fill_in "Index", with: @supporter_notification.index
    fill_in "Show", with: @supporter_notification.show
    click_on "Update Notification"

    assert_text "Notification was successfully updated"
    click_on "Back"
  end

  test "should destroy Notification" do
    visit supporter_notification_url(@supporter_notification)
    click_on "Destroy this notification", match: :first

    assert_text "Notification was successfully destroyed"
  end
end
