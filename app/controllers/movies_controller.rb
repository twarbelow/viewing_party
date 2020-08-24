class MoviesController < ApplicationController
  def index
    if params[:query] != nil
      @results = (MovieDB.new.search(params[:query])).map do |movie|
        Movie.new(movie)
      end
    end
  end

  def show
    
  end
end
