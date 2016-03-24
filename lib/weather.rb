require 'json'
require 'net/http'
require 'pry'
require 'dotenv'
Dotenv.load

class Weather
  attr_reader :temp, :weather

  def initialize(args)
    @temp = args["temp_f"]
    @weather = args["weather"]
  end

  def self.all
    key = ENV["WUNDERGROUND_API_KEY"]
    uri = URI("http://api.wunderground.com/api/#{key}/conditions/q/MA/Boston.json")
    response = Net::HTTP.get_response(uri)
    weather = JSON.parse(response.body)["current_observation"]
    weather_info = Weather.new(weather)
  end

end
