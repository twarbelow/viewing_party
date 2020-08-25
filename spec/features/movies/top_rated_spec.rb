require 'rails_helper'

RSpec.describe "as an authorized user" do
  it "I can go to a discover movies page that has a link to find top movies and a text field to perform a keyword search with a 'Find Movies' button" do
    VCR.use_cassette('top_rated_content', :match_requests_on => [:method, :path]) do
      login_as_user

      click_button "Discover Movies"
      click_button("Find Top-Rated Movies")
      expect(page.all('table tr').count).to eq(21)
    end
  end
end

# expect(page).to have_css(".top-movie", count: 40)
#
# within(".top-movie", match: :first) do
#   expect(page).to have_content("Title: ")
#   expect(page).to have_css(".title-link", count: 1)
#   expect(page).to have_content("Vote Average: ")
# end
