require "application_system_test_case"

class Supporter::PlayersTest < ApplicationSystemTestCase
  setup do
    @supporter_player = supporter_players(:one)
  end

  test "visiting the index" do
    visit supporter_players_url
    assert_selector "h1", text: "Players"
  end

  test "should create player" do
    visit supporter_players_url
    click_on "New player"

    click_on "Create Player"

    assert_text "Player was successfully created"
    click_on "Back"
  end

  test "should update Player" do
    visit supporter_player_url(@supporter_player)
    click_on "Edit this player", match: :first

    click_on "Update Player"

    assert_text "Player was successfully updated"
    click_on "Back"
  end

  test "should destroy Player" do
    visit supporter_player_url(@supporter_player)
    click_on "Destroy this player", match: :first

    assert_text "Player was successfully destroyed"
  end
end
