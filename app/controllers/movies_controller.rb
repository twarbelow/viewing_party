class MoviesController < ApplicationController
  def index
    @results = MovieDB.new.search(params[:query]).map { |movie| Movie.new(movie) } unless params[:query].nil?
  end

  def top_rated

  end
end
