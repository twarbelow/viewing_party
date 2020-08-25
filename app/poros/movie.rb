class Movie
  attr_reader :id,
              :title ,
              :tagline,
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
    @vote_average = info[:vote_average]
    @runtime = info[:runtime]
    @genre = info[:genre]
    @overview = info[:overview]
    @cast = info[:cast]
    @review_count = info[:total_results]
    @reviews = info[:reviews]
  end
end
