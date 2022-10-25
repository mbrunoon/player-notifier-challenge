require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  
  test "player.age" do
    player = Player.new    
    assert_nil(player.age, "age must be nil when birthday wasn't informed")

    player.birthdate = Date.today - 20.year
    assert_equal(20, player.age, "age must be 20 on birthday")

    player.birthdate = Date.today - 20.year + 1.day
    assert_equal(19, player.age, "age must be 19 one day or more before birthday")
  end

end
