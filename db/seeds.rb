require 'json'
require 'open-uri'
puts 'Cleaning database...'
Movie.destroy_all

result = URI.open 'http://tmdb.lewagon.com/movie/top_rated'
movies = JSON.parse(result.read)

movies['results'].each do |movie|
  puts 'Creating movies...'

  poster_url = "https://image.tmdb.org/t/p/original#{movie['poster_path']}"
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: poster_url.to_s,
    rating: movie['vote_average']
  )

  puts "Created #{movie['title']}"
end

puts 'Finished'
