class Movie
  attr_reader :id,
              :title ,
              :tagline,
              :release_date,
              :vote_average,
              :runtime,
              :genre ,
              :overview,
              :cast,
              :review_count,
              :reviews

  def initialize(info)
    @id = info[:id]
    @title = info[:title]
    @tagline = info[:tagline]
    @release_date = info[:release_date]
    @vote_average = info[:vote_average]
    @total_minutes = info[:runtime]
    @genre = info[:genre]
    @overview = info[:overview]
    @cast = info[:cast]
    @review_count = info[:total_results]
    @reviews = info[:reviews]
  end

  def runtime
    hours = @total_minutes / 60
    minutes = "%02d" % (@total_minutes % 60)
    "#{hours}:#{minutes}"
  end
end
