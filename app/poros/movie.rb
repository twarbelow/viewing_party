class Movie
  attr_reader :id,
              :title,
              :tagline,
              :release_date,
              :vote_average,
              :runtime,
              :genres,
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
    @genres = info[:genres]
    @overview = info[:overview]
    @cast = info[:cast]
    @review_count = info[:total_results]
    @reviews = info[:results]
  end

  def runtime
    hours = @total_minutes / 60
    minutes = '%02d' % (@total_minutes % 60)
    "#{hours}:#{minutes}"
  end

  def first_10_cast
    cast.first(10)
  end
end
