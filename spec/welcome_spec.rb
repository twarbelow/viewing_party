require 'rails_helper'

feature "welcome page" do
  it "has a brief description of the application" do
    visit "/"
    expect(page).to have_content("Welcome to Covid Viewing! Your favorite site for finding your next covid watch party movie, and scheduling a time to watch it with all your friends!")
  end
end
