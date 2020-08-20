require 'rails_helper'

RSpec.feature "log in" do
  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({

  })
  end
  it "has log in link on Welcome page" do
    visit '/'
    expect(page).to have_link("Log In With Google")
  end

  it "allows a user to log in with OmniAuth Google" do
    stub_omniauth
    visit '/'
    click_link "Log In With Google"
    expect(current_path).to eq('/auth/google')
  end
end
