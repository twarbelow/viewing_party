require 'rails_helper'

RSpec.feature "As a user on the welcome page" do
  let(:friend) do
    User.create!(
      first_name: 'John',
      last_name: 'Doe',
      email: 'myfriend@gmail.com'
    )
  end

  before do
    login_as_user
  end

  scenario "There is a form field to add a friend by email address" do

    visit "/"
    expect(page).to have_button("Add Friend")
    friend
    expect do
      within("form#friends") do
        fill_in :email_id, with: "myfriend@gmail.com"
        click_button("Add Friend")
      end
    end.to change { current_user.friends.count }.by(1)

    expect(friend.friends.include?(current_user)).to be_truthy
    visit '/'
    within(".friends") do
      expect(page).to have_content("Friends")
      expect(page).to have_content("John")
    end
  end

  scenario 'If the email address is not correlated with a user in the database, a flash message notifies the current user that no friend was added' do
    visit '/'
    expect do
      within("form#friends") do
        fill_in :email_id, with: "typo@gmail.com"
        click_button("Add Friend")
      end
    end.not_to change { current_user.friends.count }
    expect(friend.friends.include?(current_user)).to be_falsey
  end

  end
