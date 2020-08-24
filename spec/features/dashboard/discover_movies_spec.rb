require 'rails_helper'

RSpec.feature "As a user" do
  scenario "I click on a link on my dashboard that takes me to a movie discovery page" do
    stub_omniauth
    visit root_path
    expect(page).to have_link("Sign in with Google")
    click_link "Sign in with Google"

    expect(page).to have_button("Discover Movies")
    click_button("Discover Movies")
    expect(current_path).to eq("/movies/discover")
  end

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
          expires_at: "063021",
        }
      })
    end
end