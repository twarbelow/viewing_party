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

  it "I can go to a discover movies page that has a link to find top movies and a text field to perform a keyword search with a 'Find Movies' button" do
    stub_omniauth
    visit root_path
    click_link "Sign in with Google"

    click_button "Discover Movies"

    click_button ("Find Top-Rated Movies")

    expect(page).to have_css(".top-movie", count: 40)

    within(".top-movie", match: :first) do
      expect(page).to have_content("Title: ")
      expect(page).to have_css(".title-link", count: 1)
      expect(page).to have_content("Vote Average: ")
    end

  end
end
