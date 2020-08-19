require 'rails_helper'

feature "log in" do
  it "has log in link on Welcome page" do
    visit '/'
    expect(page).to have_link("Log In With Google")
  end

  it "allows a user to log in with OmniAuth Google" do
    visit '/'
    click_on "Log In With Google"
    expect(current_path).to eq('/auth/google')
  end
end
