require "json"
require "open-uri"

# API for movies
url = "http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>"
movie_serialized = URI.open(url).read
movie = JSON.parse(movie_serialized)

movie['results'].each do |m|
  Movie.create(
    title: m['title'],
    overview: m['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{m['poster_path']}",
    rating: m['vote_average']
  )
end

List.create(
  name: 'Comedy'
)
