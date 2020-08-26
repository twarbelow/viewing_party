require 'rails_helper'

RSpec.feature "As a user on the welcome page" do

  before :each do
    login_as_user
    current_user = User.last

    @friend = User.create!(
      first_name: 'John',
      last_name: 'Doe',
      email: 'myfriend@gmail.com'
    )
    Friendship.create(user_id: current_user.id, friend_id: @friend.id)
    @view_party = ViewParty.create!(
      user_id: @friend.id,
      movie_title: "Caddyshack",
      when: "2020-09-27 11:00:00",
      duration: 120
    )
    @view_party.invitees.create!(user_id: current_user.id)
    @view_party_2 = ViewParty.create!(
      user_id: current_user.id,
      movie_title: "Frozen",
      when: "2020-09-28 11:00:00",
      duration: 130
    )
  end

  scenario "I can see viewing parties that I have been invited to" do
    visit '/'
    within(".viewing_parties") do
      expect(page).to have_content("Viewing Parties")
      expect(page).to have_content("Caddyshack")
    end
  end

  scenario "I can see viewing parties that I have created" do
    visit '/'
    within(".viewing_parties") do
      expect(page).to have_content("Frozen")
      save_and_open_page
    end
  end
end
