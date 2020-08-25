require 'rails_helper'

RSpec.describe "as an authorized user" do
  it "I can go to a discover movies page that has a link to find top movies and a text field to perform a keyword search with a 'Find Movies' button" do
    login_as_user

    expect(page).to have_button("Discover Movies")
    click_button "Discover Movies"

    expect(current_path).to eq("/movies/discover")
    expect(page).to have_button("Find Top-Rated Movies")
    expect(page).to have_css(".find-movies")
    expect(page).to have_button("Find Movies")
  end
end
