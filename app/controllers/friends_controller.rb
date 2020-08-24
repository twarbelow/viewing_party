class FriendsController < ApplicationController
  before_action :verify_current_user

  def create
    friend = User.find_by(email: params[:email_id])
    if friend
      current_user.add_friend(friend)
      flash[:notice] = "#{friend.first_name} has been added as your friend"
    else
      flash[:alert] = "There is no user with that email address"
    end
    redirect_to root_path
  end
end
