require 'rails_helper'

feature "visitor can login to google" do
   scenario "there is a link on the welcome page to login via google" do
     stub_omniauth
     visit root_path
     expect(page).to have_link("Sign in with Google")
     click_link "Sign in with Google"
     expect(page).to have_content("Jesse Spevack")
  #   expect(page).to have_link("Logout")
   end


  def stub_omniauth
  # first, set OmniAuth to run in test mode
  OmniAuth.config.test_mode = true
  # then, provide a set of fake oauth data that
  # omniauth will use when a user tries to authenticate:
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({

  })
end

end
