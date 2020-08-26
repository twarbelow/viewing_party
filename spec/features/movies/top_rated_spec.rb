require 'rails_helper'

RSpec.describe "as an authorized user" do
  it "I can go to a discover movies page that has a link to find top movies and a text field to perform a keyword search with a 'Find Movies' button" do
    VCR.use_cassette('top_rated_movies') do
      login_as_user

      click_button "Discover Movies"
      click_button("Find Top-Rated Movies")
      expect(page.all('table tr').count).to eq(41)
      save_and_open_page
    end
  end
end
