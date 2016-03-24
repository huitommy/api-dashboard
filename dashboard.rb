require "./lib/geolocation"
require "sinatra/base"
require 'pry'
require './lib/article'
require './lib/weather'
require './lib/events'

require "dotenv"
Dotenv.load

class Dashboard < Sinatra::Base
  get("/") do
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)
    erb :dashboard
  end

  get "/news" do
    @articles = Article.all
    erb :news
  end

  get "/weather" do
    @weather = Weather.all
    erb :weather
  end

  get "/events" do
    @events = Event.all
    erb :event
  end
end
