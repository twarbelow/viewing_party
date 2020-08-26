class ViewParty < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :invitees, dependent: :destroy
  validates_presence_of :movie_title
  has_many :users, through: :invitees, dependent: :destroy

  def length
    hours = (duration / 60).to_i
    minutes = (duration % 60).to_i.to_s.rjust(2,"0")
    length = "#{hours}:#{minutes}"
    length
  end

  def self.find_user_view_parties(user)
    where("user_id =?", user.id)
  end
end
