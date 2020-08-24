class MoviesController < ApplicationController
  before_action :verify_current_user

  def index
    @results = MovieDB.new.search(params[:query]).map { |movie| Movie.new(movie) } unless params[:query].nil?
  end

  def top_rated
    @movies = MovieDb.new.top_rated
  end

  def show
    @movie = MovieDb.new.movie_details(params[:id])
  end
end
