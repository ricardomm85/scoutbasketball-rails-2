require "application_system_test_case"

class PlayersTest < ApplicationSystemTestCase
  setup do
    @player = players(:one)
  end

  test "visiting the index" do
    visit players_url
    assert_selector "h1", text: "Players"
  end

  test "should create player" do
    visit players_url
    click_on "New player"

    fill_in "Birthday", with: @player.birthday
    fill_in "Birthmonth", with: @player.birthmonth
    fill_in "Birthyear", with: @player.birthyear
    fill_in "Facebook", with: @player.facebook
    fill_in "Hand", with: @player.hand
    fill_in "Height", with: @player.height
    fill_in "Hs position", with: @player.hs_position
    fill_in "Hs year", with: @player.hs_year
    fill_in "Instagram", with: @player.instagram
    fill_in "Name", with: @player.name
    fill_in "Positions validated", with: @player.positions_validated
    fill_in "Recruiter", with: @player.recruiter_id
    fill_in "Slug", with: @player.slug
    fill_in "Surname", with: @player.surname
    fill_in "Twitter", with: @player.twitter
    fill_in "Weight", with: @player.weight
    click_on "Create Player"

    assert_text "Player was successfully created"
    click_on "Back"
  end

  test "should update Player" do
    visit player_url(@player)
    click_on "Edit this player", match: :first

    fill_in "Birthday", with: @player.birthday
    fill_in "Birthmonth", with: @player.birthmonth
    fill_in "Birthyear", with: @player.birthyear
    fill_in "Facebook", with: @player.facebook
    fill_in "Hand", with: @player.hand
    fill_in "Height", with: @player.height
    fill_in "Hs position", with: @player.hs_position
    fill_in "Hs year", with: @player.hs_year
    fill_in "Instagram", with: @player.instagram
    fill_in "Name", with: @player.name
    fill_in "Positions validated", with: @player.positions_validated
    fill_in "Recruiter", with: @player.recruiter_id
    fill_in "Slug", with: @player.slug
    fill_in "Surname", with: @player.surname
    fill_in "Twitter", with: @player.twitter
    fill_in "Weight", with: @player.weight
    click_on "Update Player"

    assert_text "Player was successfully updated"
    click_on "Back"
  end

  test "should destroy Player" do
    visit player_url(@player)
    click_on "Destroy this player", match: :first

    assert_text "Player was successfully destroyed"
  end
end
