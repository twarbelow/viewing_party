require 'rails_helper'

RSpec.feature 'As a user' do
  before do
    login_as_user
  end

  scenario "Clicking on the title of a movie on the movie results page will send me to the movie show page" do
    visit movies_discover_path

    top_rated_json_response = File.read('spec/fixtures/top_rated_content.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV["API_KEY"]}").
      to_return(status: 200, body: top_rated_json_response )

    click_button("Find Top-Rated Movies")

    godfather_json_response = File.read('spec/fixtures/godfather_content.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV["API_KEY"]}").
      to_return(status: 200, body: godfather_json_response)
    click_link "The Godfather"

    expect(page).to have_content("The Godfather")
    expect(page).to have_content("An offer you can't refuse")

  end


end
