class ViewParty < ApplicationRecord
  belongs_to :user
  has_many :invitees
  validates_presence_of :movie_title
  has_many :users, through: :invitees
end
