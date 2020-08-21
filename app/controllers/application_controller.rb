class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def verify_current_user
    if current_user
      return current_user
    else
      flash[:error] = "Please sign in"
      redirect_to root_path
    end
  end
end
