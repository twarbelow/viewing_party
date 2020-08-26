require 'rails_helper'

RSpec.describe ViewParty, type: :model do
  before :each do
    @user = User.create!(
      first_name: 'John',
      last_name: 'Doe',
      email: 'myfriend@gmail.com'
    )
    @view_party = ViewParty.create!(
      user_id: @user.id,
      movie_title: "Caddyshack",
      when: "2020-09-27 11:00:00",
      duration: 123
    )
  end
  it '#converted party duration to hours:minutes format' do

    expect(@view_party.length).to eq("2:03")
  end

  it '#find user-created list of viewing parties' do
    party_list = ViewParty.find_user_view_parties(@user)
    expect(party_list.size).to eq(1)
    expect(party_list.first.class).to eq(ViewParty)
    expect(party_list.first.movie_title).to eq("Caddyshack")
  end
end
