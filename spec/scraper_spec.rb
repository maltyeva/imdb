# data for #fetch_movies_url:
require_relative "../scraper.rb"

describe "fetch_movies_url" do
  it 'Should return an array of 5 movies' do
    actual_value = fetch_movies_url
    expected_value = [
      "https://www.imdb.com/title/tt0111161/",
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0050083/"
    ]
    expect(actual_value).to eq(expected_value)
  end
end

describe "scrape_movie" do
  it 'should return a hash with 5 keys' do
    actual_value = scrape_movie("https://www.imdb.com/title/tt0468569")
    expected_value = {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham, the Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008
    }
    expect(actual_value).to eq(expected_value)
  end
end

movies =[
  "http://www.imdb.com/title/tt0111161/",
  "http://www.imdb.com/title/tt0068646/",
  "http://www.imdb.com/title/tt0071562/",
  "http://www.imdb.com/title/tt0468569/",
  "http://www.imdb.com/title/tt0050083/"
]

# data for #scrape_movie:
{
  cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
  director: "Christopher Nolan",
  storyline: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham, the Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
  title: "The Dark Knight",
  year: 2008
}
