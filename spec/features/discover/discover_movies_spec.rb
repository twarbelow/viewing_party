require 'rails_helper'

RSpec.feature "As a user" do
  before do
    login_as_user
  end

  # scenario "On the movie discovery page, there is a button to see the top 40 rated moves and a search field to search movies by keyword" do
  #   visit discover_path
  #   expect(page).to have_button("Top Rated Movies")
  #   within(".form") do
  #     fill_in "Search", with: "comedy"
  #     click_button "Find Movies"
  #   end
  # end

  scenario "Clicking on the Top 40 Rated Movies Button will return a table of those movies" do
    VCR.use_cassette('top_rated_content') do
      visit movies_discover_path
      click_button("Find Top-Rated Movies")
      expect(page.all('table tr').count).to eq(21)
    end
  end
end
