require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  test "User Relations" do    
    user = users(:one)
    assert_equal(user.user_favorite_players, user.favorite_players, "There are differences between methods favorite_players results")
  end

  test "Checking user role on creation" do
    user = User.new
    assert_equal("supporter", user.role, "New users must have the role supporter")
  end  

end
