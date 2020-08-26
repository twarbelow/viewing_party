require 'rails_helper'

RSpec.describe "as an authorized user" do
  it "I can search the movies and see the first 40 results" do
    VCR.use_cassette('star_wars_search', :match_requests_on => [:method, :path]) do
      login_as_user

      visit movies_discover_path

      expect(page).to have_content("Search All Movies")
      fill_in "query", with: "Star Wars"
      click_button "Find Movies"

      expect(current_path).to eq(movies_search_results_path)
      expect(page).to have_button("Find Top-Rated Movies")
      expect(page).to have_css(".result", count: 40)
      expect(page).to have_css(".find-movies")
    end
  end
end
