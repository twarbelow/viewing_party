require 'rails_helper'

RSpec.describe Invitee, type: :model do
  before :each do
    @john = User.create(first_name: "John", last_name: "Smith", email: "john@email.com" )
    @jane = User.create(first_name: "Jane", last_name: "Doe", email: "jane@email.com")
    @user = User.create(first_name: "User", last_name: "User", email: "user@email.com")

    @viewing_party_1 = ViewParty.create(movie_title: "Caddyshack", when: "2020-09-27 11:00:00", duration: 120, user_id: @john.id)
    @viewing_party_2 = ViewParty.create(movie_title: "Beverly Hills Cop", when: "2020-09-28 11:00:00", duration: 95, user_id: @jane.id)

    Invitee.create(view_party_id: @viewing_party_1.id, user_id: @user.id, accepted?: true)
    Invitee.create(view_party_id: @viewing_party_2.id, user_id: @user.id, accepted?: true)
  end

  it '.can produce a list of invitations where the user is the invitee' do
    list = Invitee.list_user_invitations(@user)
    expect(list.size).to eq(2)
    expect(list.first.class).to eq(Invitee)
  end

  it '.can produce a list of all parties the user is invited to' do
    party_list = Invitee.parties_user_is_invited_to(@user)
    expect(party_list.size).to eq(2)
    expect(party_list.first.class).to eq(ViewParty)
  end
end
