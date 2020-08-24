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

    click_link "Discover Movies"

    click_link ("Find Top-Rated Movies")
  end
end
