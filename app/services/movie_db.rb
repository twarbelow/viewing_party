class MovieDb

  def top_rated
    response = conn.get("movie/top_rated")
    JSON.parse(response.body, symbolize_names: true)[:results]
  end
  private

  def conn
    @conn ||= Faraday.new(
      url: "https://api.themoviedb.org/3/",
      params: {api_key: ENV['API_KEY']},
      headers: {'Content-Type' => 'application/json'}
    )
  end
end
