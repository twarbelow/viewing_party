class MovieDB
  def initialize
    @response1 = []
    @response2 = []
  end
  
  def search(query)
    search_responses(query)
    # response_1 = conn.get("/3/search/movie?api_key=#{ENV['MOVIEDB_API_KEY']}&sort_by=popularity.desc&page=1&query=#{query}")
    # response_2 = conn.get("/3/search/movie?api_key=#{ENV['MOVIEDB_API_KEY']}&sort_by=popularity.desc&page=2&query=#{query}")
    first_40_results(@response1, @response2)
    # page_1 = JSON.parse(response_1.body, symbolize_names: true)
    # page_1 = page_1[:results]
    # page_2 = JSON.parse(response_2.body, symbolize_names: true)
    # page_2 = page_2[:results]
    # page_1.concat(page_2)
  end

  def first_40_results(response1, response2)
    page1 = JSON.parse(response1.body, symbolize_names: true)
    page1 = page1[:results]
    page2 = JSON.parse(response2.body, symbolize_names: true)
    page2 = page2[:results]
    page1.concat(page2)
  end

  def search_responses(query)
    @response1 = conn.get("/3/search/movie?api_key=#{ENV['MOVIEDB_API_KEY']}&sort_by=popularity.desc&page=1&query=#{query}")
    @response2 = conn.get("/3/search/movie?api_key=#{ENV['MOVIEDB_API_KEY']}&sort_by=popularity.desc&page=2&query=#{query}")
  end

  def top_rated
    response = conn.get('movie/top_rated')
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  private

  def conn
    @conn ||= Faraday.new(
      url: 'https://api.themoviedb.org/3/',
      params: {api_key: ENV['MOVIEDB_API_KEY']},
      headers: {'Content-Type' => 'application/json'}
    )
  end
end
