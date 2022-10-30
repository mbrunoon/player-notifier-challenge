require "application_system_test_case"

class Supporter::UserFavoritePlayersTest < ApplicationSystemTestCase
  setup do
    @supporter_user_favorite_player = supporter_user_favorite_players(:one)
  end

  test "visiting the index" do
    visit supporter_user_favorite_players_url
    assert_selector "h1", text: "User favorite players"
  end

  test "should create user favorite player" do
    visit supporter_user_favorite_players_url
    click_on "New user favorite player"

    click_on "Create User favorite player"

    assert_text "User favorite player was successfully created"
    click_on "Back"
  end

  test "should update User favorite player" do
    visit supporter_user_favorite_player_url(@supporter_user_favorite_player)
    click_on "Edit this user favorite player", match: :first

    click_on "Update User favorite player"

    assert_text "User favorite player was successfully updated"
    click_on "Back"
  end

  test "should destroy User favorite player" do
    visit supporter_user_favorite_player_url(@supporter_user_favorite_player)
    click_on "Destroy this user favorite player", match: :first

    assert_text "User favorite player was successfully destroyed"
  end
end
