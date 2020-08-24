class MoviesController < ApplicationController
  def index
    return unless params[:query] = nil
      @results = (MovieDB.new.search(params[:query])).map do |movie|
        Movie.new(movie)
      end
    end
  end
end
