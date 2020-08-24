class MoviesController < ApplicationController
  def index
    if params[:query] != nil
      @results = MovieDB.new.search(params[:query])
    end
  end
end
