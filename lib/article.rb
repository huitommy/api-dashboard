require 'json'
require 'net/http'
require 'pry'
require 'dotenv'
Dotenv.load

class Article
  attr_reader :title, :section, :abstract, :url

  def initialize(args)
    @title = args["title"]
    @section = args["section"]
    @abstract = args["abstract"]
    @url = args["url"]
  end

  def self.all
    articles = []
    key = ENV["NYTIMES_API_KEY"]
    uri = URI("http://api.nytimes.com/svc/topstories/v1/home.json?api-key=#{key}")

    response = Net::HTTP.get_response(uri)
    news = JSON.parse(response.body)["results"]
    5.times do
      articles << Article.new(news.shift)
    end
    articles
  end
end
