require "application_system_test_case"

class Admin::PlayersTest < ApplicationSystemTestCase
  setup do
    @admin_player = admin_players(:one)
  end

  test "visiting the index" do
    visit admin_players_url
    assert_selector "h1", text: "Players"
  end

  test "should create player" do
    visit admin_players_url
    click_on "New player"

    click_on "Create Player"

    assert_text "Player was successfully created"
    click_on "Back"
  end

  test "should update Player" do
    visit admin_player_url(@admin_player)
    click_on "Edit this player", match: :first

    click_on "Update Player"

    assert_text "Player was successfully updated"
    click_on "Back"
  end

  test "should destroy Player" do
    visit admin_player_url(@admin_player)
    click_on "Destroy this player", match: :first

    assert_text "Player was successfully destroyed"
  end
end
