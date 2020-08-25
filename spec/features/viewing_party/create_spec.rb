require 'rails_helper'

RSpec.feature 'As a user' do
  before do
    login_as_user
  end

  scenario "On the movie show page, you can create a viewing party for that movie" do
    VCR.use_cassette('top_rated_content') do
      visit movies_discover_path

      click_button("Find Top-Rated Movies")
    end

    VCR.use_cassette('godfather_content') do
      click_link "The Godfather"

      expect(page).to have_content("The Godfather")
      expect(page).to have_content("An offer you can't refuse")
      expect(page).to have_button("Create Viewing Party")
      click_button "Create Viewing Party"
      expect(page).to have_content("The Godfather")
    end



  end
end
