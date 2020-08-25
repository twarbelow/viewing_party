require 'rails_helper'

RSpec.describe ViewParty, type: :model do
  it '#converted party duration to hours:minutes format' do

    user = User.create!(
      first_name: 'John',
      last_name: 'Doe',
      email: 'myfriend@gmail.com'
    )
    view_party = ViewParty.create!(
      user_id: user.id,
      movie_title: "Caddyshack",
      when: "2020-09-27 11:00:00",
      duration: 123
    )

    expect(view_party.length).to eq("2:03")
  end
end
