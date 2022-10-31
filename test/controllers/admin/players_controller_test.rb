require "test_helper"

class Admin::PlayersControllerTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
    @player = players(:one)
  end

  test "should get JSON index" do
    get admin_players_url, as: :json
    assert_response :success
  end

  test "should get HTML index" do
    skip
    get admin_players_url
    assert_response :success
  end

  test "should get new" do
    skip
    get new_admin_player_url
    assert_response :success
  end

  test "should create player by JSON" do
    assert_difference("Player.count") do
      post admin_players_url, params: { player: { 
        name: "Player Test", 
        number: 11,
        nationality: "BR",
        birthdate: (Date.today - 20.year),
        position: "M",
        team_id: teams(:one).id
        }
      }, as: :json
    end
    assert_response :created
  end

  test "should show JSON player" do
    get admin_player_url(@player), as: :json
    assert_response :success
  end

  test "should show HTML player" do
    skip
    get admin_player_url(@player)
    assert_response :success
  end  

  test "should get edit" do
    skip
    get edit_admin_player_url(@player)
    assert_response :success
  end

  test "should update JSON player" do    
    patch admin_player_url(@player), params: { player: { 
      name: "Edit Test", 
      number: 10,
      nationality: "PT",
      birthdate: (Date.today - 20.year),
      position: "G",
      team_id: teams(:two).id
     } }, as: :json
     
    assert_response :ok
  end

  test "should destroy JSON player" do
    skip    
    assert_difference("Player.count", -1) do
      delete admin_player_url(@player), as: :json
    end       
  end

end
