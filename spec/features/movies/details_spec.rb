require 'rails_helper'

RSpec.feature 'As a user' do
  before do
    login_as_user
  end

  scenario "clicking on the title of a movie from either the top rated or search results will show me that movie's show page with details" do
    VCR.use_cassette('star_wars_search', :match_requests_on => [:method, :path]) do
      visit movies_discover_path

      fill_in "query", with: "Star Wars"
      click_button "Find Movies"

      click_link "Star Wars"
      expect(page).to have_css('.title')
      expect(page).to have_css('.vote-average')
      expect(page).to have_css('.runtime')
      expect(page).to have_css('.genre')
      expect(page).to have_css('.description-summary')
      expect(page).to have_css('.first-10-cast')
      expect(page).to have_css('.review-count')
      expect(page).to have_css('.reviews')

      # Movie Title
      # Vote Average of the movie
      # Runtime in hours & minutes
      # Genere(s) associated to movie
      # Summary description
      # List the first 10 cast members (characters&actress/actors --> character: actress/ors)
      # Count of total reviews
      # Each review author and information
    end

    VCR.use_cassette('top_rated_content', :match_requests_on => [:method, :path]) do
      visit movies_discover_path

      click_button("Find Top-Rated Movies")
    end
    VCR.use_cassette('godfather_content', :match_requests_on => [:method, :path]) do
      click_link "The Godfather"

      expect(page).to have_content("The Godfather")
      expect(page).to have_content("An offer you can't refuse")
    end
  end


end
