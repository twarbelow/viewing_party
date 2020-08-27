class MoviesController < ApplicationController
  before_action :verify_current_user

  def index
    @results = MovieDb.new.search(params[:query]).map { |movie| Movie.new(movie) } unless params[:query].blank?
  end

  def top_rated
    @movies = MovieDb.new.top_forty_rated.map { |movie| Movie.new(movie) }
  end

  def show
    info = MovieDb.new.movie_details(params[:id])
    @movie = Movie.new(info)
  end
end
