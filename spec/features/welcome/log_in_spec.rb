require 'rails_helper'

feature "log in" do
  it "has log in link on Welcome page" do
    visit '/'
    expect(page).to have_link("Log In With Google")
  end

  it "allows a user to log in with OmniAuth Google" do

  end
end
