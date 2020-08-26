class MovieDb
  def search(query)
    search_responses(query)
    first_40_results(@response1, @response2)
  end

  def first_40_results(response1, response2)
    page1 = JSON.parse(response1.body, symbolize_names: true)
    page1 = page1[:results]
    page2 = JSON.parse(response2.body, symbolize_names: true)
    page2 = page2[:results]
    page1.concat(page2)
  end

  def search_responses(query)
    @response1 = conn.get(
      "/3/search/movie?api_key=#{ENV['MOVIEDB_API_KEY']}&sort_by=popularity.desc&page=1&query=#{query}"
    )
    @response2 = conn.get(
      "/3/search/movie?api_key=#{ENV['MOVIEDB_API_KEY']}&sort_by=popularity.desc&page=2&query=#{query}"
    )
  end

  def top_rated
    response = conn.get('movie/top_rated')
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def movie_details(id)
    parse_movie_responses(id)
    combine_movie_responses
    # combined_responses(id)
    # response = conn.get("movie/#{id}")
    # JSON.parse(response.body, symbolize_names: true)
  end

  def parse_movie_responses(id)
    info = movie_info_request(id)
    @info = JSON.parse(info.body, symbolize_names: true)
    reviews = movie_reviews_request(id)
    @reviews = JSON.parse(reviews.body, symbolize_names: true)
    credits = movie_credits_request(id)
    @credits = JSON.parse(credits.body, symbolize_names: true)
  end

  def combine_movie_responses
    @credits.merge(@reviews).merge(@info)
  end

  def movie_info_request(id)
    conn.get("movie/#{id}")
  end

  def movie_reviews_request(id)
    conn.get("movie/#{id}/reviews")
  end

  def movie_credits_request(id)
    conn.get("movie/#{id}/credits")
  end

  private

  def conn
    @conn ||= Faraday.new(
      url: 'https://api.themoviedb.org/3/',
      params: {
        api_key: ENV['MOVIEDB_API_KEY']
      },
      headers: {
        'Content-Type' => 'application/json'
      }
    )
  end
end
