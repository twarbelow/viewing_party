require 'rails_helper'

RSpec.feature 'As a user' do
  before do
    login_as_user
  end

  scenario "On the movie show page, you can create a viewing party for that movie" do
    VCR.use_cassette('top_rated_movies', :match_requests_on => [:method, :path]) do
      visit movies_discover_path

      click_button("Find Top-Rated Movies")
    end

    VCR.use_cassette('godfather_content', :match_requests_on => [:method, :path]) do
      click_link "The Godfather"

      expect(page).to have_content("The Godfather")
      expect(page).to have_content("An offer you can't refuse")
      expect(page).to have_link("Create Viewing Party")
      click_link "Create Viewing Party"
      expect(page).to have_content("The Godfather")
      fill_in "Duration", with: "178"
      fill_in "Date and Time", with: Time.new(2022, 01, 02, 12)
      click_on "Create View party"
    end



  end
end
