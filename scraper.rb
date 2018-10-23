require 'nokogiri'
require 'open-uri'

def fetch_movies_url
  imdb = "https://www.imdb.com/chart/top"
  imdb_base_url = "https://www.imdb.com"
  imdb_read = open(imdb).read
  imdb_parse = Nokogiri::HTML(imdb_read)
  imdb_path = []
  imdb_parse.search(".titleColumn a").each do |movie|
    imdb_path << movie.attribute("href").value
  end
  imdb_arr = imdb_path.take(5).map do |url|
    imdb_base_url + url.split("?")[0]
  end
  return imdb_arr
end

def scrape_movie (url)
  parsed_url = Nokogiri::HTML(open(url, "Accept-Language" =>  "en").read)
  movie_name_year = parsed_url.search(".title_wrapper h1").text.split("(")
  movie_name = movie_name_year.first.gsub("&nbsp;","")
  movie_year = movie_name_year.last.gsub(")","").gsub(" ", "")
  summary_text = parsed_url.search(".summary_text").text.strip
  movie_hash = {title: movie_name, year: movie_year, storyline: summary_text }
  return movie_hash

end
