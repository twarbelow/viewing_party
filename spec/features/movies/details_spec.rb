require 'rails_helper'

RSpec.feature 'As a user' do
  before do
    login_as_user
  end

  scenario "Clicking on the title of a movie on the movie results page will send me to the movie show page" do
    VCR.use_cassette('top_rated_content', :match_requests_on => [:path]) do
      visit movies_discover_path

      click_button("Find Top-Rated Movies")
    end
    VCR.use_cassette('godfather_content') do
      click_link "The Godfather"

      expect(page).to have_content("The Godfather")
      expect(page).to have_content("An offer you can't refuse")
    end
  end


end
