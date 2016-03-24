require "spec_helper"

RSpec.describe Event, vcr: true do
  context "ip can be geolocated" do
    let(:event) { Event.new ({ "title" => "Dancing", "venue" => { "name" => "Boston"}}) }

    describe "#title" do
      it "returns the title of the event " do
        expect(event.title).to eq("Dancing")
      end
    end

    describe "#venue" do
      it "returns the section based on " do
        expect(event.venue).to eq("Boston")
      end
    end

    describe ".all" do
      it "returns an array of Event objects" do
        event = Event.all
        expect(event[0]).to be_a(Event)
      end
    end
  end
end
