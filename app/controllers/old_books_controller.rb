require "json"
require "open-uri"

class BooksController < ApplicationController
  def browse
    url = "https://openlibrary.org/search.json?q=#{params[:query]}"
    results = JSON.parse(URI.open(url).read)["docs"]
    @books = []
    results.first(20).each do |result|
      @books << Book.new(store_results(result))
    end
    @books
  end

  def create
  end

  private

  def store_results(item)
    {
      author: Author.find_by(name: item["author_name"].join("&")) || Author.create!(name: item["author_name"].join("&")),
      genre_id: item["type"],
      year: item["first_publish_year"],
      title: item["title"],
      oclc: item["oclc"] ? "https://covers.openlibrary.org/b/oclc/#{item["oclc"].first}-M.jpg" : ""
    }
  end
end
