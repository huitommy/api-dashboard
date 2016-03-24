require "spec_helper"

RSpec.describe Weather, vcr: true do
  context "ip can be geolocated" do
    let(:weather) { Weather.new ({ "temp_f" => "36.5", "weather" => "Cloudy"}) }

    describe "#temp" do
      it "returns the temperature " do
        expect(weather.temp).to eq("36.5")
      end
    end

    describe "#weather" do
      it "returns the weather" do
        expect(weather.weather).to eq("Cloudy")
      end
    end

    describe ".all" do
      it "returns an array of Weather objects" do
        weathers = Weather.all
        expect(weathers).to be_a(Weather)
      end

    end
  end


end
