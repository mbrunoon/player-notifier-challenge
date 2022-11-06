require "test_helper"

class Admin::PlayersControllerTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:admin)
    @player = players(:one)
  end

  test "should get list of all players" do
    get admin_players_url, as: :json
    assert_response :success
  end

  test "should create player" do
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

  test "should NOT create a player by non Admin user" do
    sign_out users(:admin)
    sign_in users(:one)

    assert_no_difference("Player.count") do
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
    assert_response :unauthorized

  end

  test "should show player" do
    get admin_player_url(@player), as: :json
    assert_response :success
  end

  test "should update player" do    
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
    player = Player.create({name: "Test deletion", number: 1, nationality: "BR", birthdate: (Date.today - 20.year), position: "M", team_id: teams(:one).id})
    assert_difference("Player.count", -1) do      
      delete admin_player_url(player), as: :json
    end       
  end

end
