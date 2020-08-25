class Friendship < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :friend, class_name: 'User', dependent: :destroy
end
