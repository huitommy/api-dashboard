require 'json'
require 'net/http'
require 'pry'

class Event
  attr_reader :title, :venue

  def initialize(args)
    @title = args["title"]
    @venue = args["venue"]["name"]
  end

  def self.all
    available_events = []
    # key = ENV["NYTIMES_API_KEY"]
    uri = URI("https://api.seatgeek.com/2/events?venue.state=MA")
    response = Net::HTTP.get_response(uri)
    events = JSON.parse(response.body)["events"]
    events.each do |event|
      available_events << Event.new(event)
    end
    available_events
  end
end
