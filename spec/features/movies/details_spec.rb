require 'rails_helper'

RSpec.feature 'As a user' do
  before do
    login_as_user
  end

  scenario "clicking on the title of a movie from either the top rated or search results will show me that movie's show page with details" do
    VCR.use_cassette('star_wars_search', :match_requests_on => [:method, :path], :record => :new_episodes) do
      visit movies_discover_path

      fill_in "query", with: "Star Wars"
      click_button "Find Movies"

      click_link "Star Wars"
      # expect(page).to have_css('.title') @movie[:title]
      # within
        # content
        # expect to have class of string/float/etc
      # expect(page).to have_css('.tag-line') @movie[:tagline]
      # expect(page).to have_css('.vote-average') # @movie[:vote_average]
      # expect(page).to have_css('.runtime') # @movie[:runtime] this is currently calculate in minutes
      # expect(page).to have_css('.genre') # this is @movie[:genres]and then [:name] from each hash within [:genres]
      # expect(page).to have_css('.overview') #this is @movie[:overview]
      # expect(page).to have_css('.first-10-cast') # will need to GET /movie/{movie_id}/credits?APIKEYHERE --> withing that[:cast] then iterate through the first 10 hashes to get :character and :name
      # expect(page).to have_css('.review-count') # will need to get to GET /movie/{movie_id}/reviews --> :total_results
      # expect(page).to have_css('.reviews') # will need to GET /movie/{movie_id}/reviews --> this will return multiple pages, :total_pages will tell you how many --> get all pages, put together the :results arrays from each page like I did for search results, iterate through each hash in the results array to get :author and :content

      # Movie Title
      # Vote Average of the movie
      # Runtime in hours & minutes
      # Genere(s) associated to movie
      # Summary description
      # List the first 10 cast members (characters&actress/actors --> character: actress/ors)
      # Count of total reviews
      # Each review author and information
    end

    # VCR.use_cassette('top_rated_content', :match_requests_on => [:method, :path]) do
    #   visit movies_discover_path
    #
    #   click_button("Find Top-Rated Movies")
    # end
    # VCR.use_cassette('godfather_content', :match_requests_on => [:method, :path]) do
    #   click_link "The Godfather"
    #
    #   expect(page).to have_content("The Godfather")
    #   expect(page).to have_content("An offer you can't refuse")
    # end
  end


end
