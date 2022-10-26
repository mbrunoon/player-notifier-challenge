require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  test "Checking user role on creation" do
    user = User.new
    assert_equal("supporter", user.role, "New users must have the role supporter")
  end

end
