require "spec_helper"

RSpec.describe Article, vcr: true do
  context "ip can be geolocated" do
    let(:article) { Article.new ({ "section" => "U.S.", "title" => "Title", "abstract" => "abstract"}) }

    describe "#title" do
      it "returns the title of the article " do
        expect(article.title).to eq("Title")
      end
    end

    describe "#section" do
      it "returns the section based on " do
        expect(article.section).to eq("U.S.")
      end
    end

    describe "#abstract" do
      it "returns abstract of the article" do
        expect(article.abstract).to eq("abstract")
      end
    end

    describe ".all" do
      it "returns an array of Article objects" do
        articles = Article.all
        expect(articles[0]).to be_a(Article)
      end

    end
  end


end
