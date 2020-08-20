class SessionsController < ApplicationController

  def create
    client_id = ENV["GOOGLE_CLIENT_ID"]
    client_secret = ENV["GOOGLE_CLIENT_SECRET"]
    code = params[:code]
    user = User.update_or_create(request.env["omniauth.auth"])
    session[:id] = user.id
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
