class MoviesController < ApplicationController
  before_action :verify_current_user

  def index
  end

  def top_rated
    redirect_to discover_path
  end

  def search
    redirect_to discover_path
  end

end
