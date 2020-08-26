class Invitee < ApplicationRecord
  belongs_to :user
  belongs_to :view_party

  def self.list_user_invitations(user)
    where('user_id =?', user.id)
  end

  def self.parties_user_is_invited_to(user)
    list_user_invitations(user).map do |invitation|
      ViewParty.find_by(id: invitation.view_party_id)
    end
  end
end
