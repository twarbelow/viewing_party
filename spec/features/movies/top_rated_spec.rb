require 'rails_helper'

RSpec.describe "as an authorized user" do
  it "I can go to a discover movies page that has a link to find top movies and a text field to perform a keyword search with a 'Find Movies' button" do
<<<<<<< HEAD
    VCR.use_cassette('top_rated_movies', :match_requests_on => [:method, :path]) do
=======
    VCR.use_cassette('top_rated_content', :match_requests_on => [:method, :path]) do
>>>>>>> a90c59f395b5079cb883c1d4e63ef39b152f8361
      login_as_user

      click_button "Discover Movies"
      click_button("Find Top-Rated Movies")
      expect(page.all('table tr').count).to eq(41)
    end
  end
end
