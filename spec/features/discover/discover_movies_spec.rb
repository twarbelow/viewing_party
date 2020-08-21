require 'rails_helper'

RSpec.feature "As a user" do
  before do
    login_as_user
  end

  scenario "On the movie discovery page, there is a button to see the top 40 rated moves and a search field to search movies by keyword" do
    visit discover_path
    expect(page).to have_button("Top Rated Movies")
    within(".form") do
      fill_in "Search", with: "comedy"
      click_button "Find Movies"
    end
  end
end
