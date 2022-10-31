require "test_helper"

class Admin::TeamsControllerTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers
  
  setup do
    sign_in users(:admin)
    @team = teams(:one)
  end

  test "should get JSON index" do
    get admin_teams_url, as: :json
    assert_response :success
  end

  test "should get new" do
    skip
    get new_admin_team_url
    assert_response :success
  end

  test "should create JSON team" do
    assert_difference("Team.count") do
      post admin_teams_url, params: { team: { 
        name: "Test", 
        acronym: "TT"
       } }, as: :json
    end

    assert_response :created
  end

  test "should show JSON team" do
    get admin_team_url(@team), as: :json
    assert_response :success
  end

  test "should get edit" do
    skip
    get edit_admin_team_url(@team)
    assert_response :success
  end

  test "should update team" do
    patch admin_team_url(@team), params: { team: { 
      name: "Test", 
      acronym: "TT"
    } }, as: :json
    assert_response :ok
  end

  test "should destroy admin_team" do
    skip
    assert_difference("Team.count", -1) do
      delete admin_team_url(@team), as: :json
    end    
  end
end
