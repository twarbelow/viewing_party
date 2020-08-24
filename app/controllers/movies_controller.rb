class MoviesController < ApplicationController
  before_action :verify_current_user

  def index; end

  def top_rated
    @movies = MovieDb.new.top_rated
  end

  def search
    redirect_to discover_path
  end

  def show
    @movie = MovieDb.new.movie_details(params[:id])
  end
end
