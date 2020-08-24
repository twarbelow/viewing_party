require 'rails_helper'

RSpec.describe "as an authorized user" do
  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: "google",
      uid: "12345678910",
      info: {
        email: "lito@gmail.com",
        first_name: "Lito",
        last_name: "White"
      },
      credentials: {
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        expires_at: DateTime.now,
      }
    })
  end

  it "I can search the movies and see the first 40 results" do
    # json_response = File.read('spec/fixtures/star_wars_search.json')
    # stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=5f797e906ade46b8521c83edea255f00&page=1&query=Star%20Wars&sort_by=p
    # opularity.desc").
    #          with(
    #            headers: {
    #           'Accept'=>'*/*',
    #           'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #           'Content-Type'=>'application/json',
    #           'User-Agent'=>'Faraday v1.0.1'
    #            }).
    #          to_return(status: 200, body: json_response, headers: {})
    VCR.use_cassette('star_wars_search') do
      stub_omniauth
      visit root_path
      click_link "Sign in with Google"

      visit movies_discover_path

      expect(page).to have_content("Search All Movies")
      fill_in "query", with: "Star Wars"
      click_button "Find Movies"

      expect(current_path).to eq(movies_search_results_path)
      expect(page).to have_link("Find Top-Rated Movies")
      expect(page).to have_css(".result", count: 40)
      expect(page).to have_css(".form")
    end
  end
end
