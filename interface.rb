require_relative "scraper.rb"
require "yaml"
#we want to scrape the url for each of the 5 movies
#create an array
#store the urls in the array
# we want to create a funtion that is going to find the information we need
#scrape the information about the cast director storyline title and year
#create a hash and store movie info
#put 5 hashes into an array [5]
#convert the information to yml
#store the information to yml
#
movies_url = fetch_movies_url
movie_description = movies_url.map do |movie|
  scrape_movie(movie)
end

p movie_description

File.open("movie.yml", "wb"){|yml|yml.write(movie_description.to_yaml)}
