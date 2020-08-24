require 'rails_helper'

RSpec.feature 'As a user' do
  before do
    login_as_user
  end

  scenario "Clicking on the title of a movie on the movie results page will send me to the movie show page" do
    visit discover_path
    click_button("Top Rated Movies")
    click_link "The Godfather"
save_and_open_page
  end


end
