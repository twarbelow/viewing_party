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
