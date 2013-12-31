require 'spec_helper'

describe QuotePresenter do

  before do
    quote = Quote.new(:text => "Some quote", :author => "Some author")
    @presenter = QuotePresenter.for(quote)
  end

  describe '#has_quote?' do
    it "returns false when a quote doesn't exist" do
      presenter = QuotePresenter.for(nil)
      expect(presenter.has_quote?).to be_false
    end

    it "returns true when quote exists" do
      expect(@presenter.has_quote?).to be_true
    end
  end

  describe '#text' do
    it 'returns the quote text' do
      expect(@presenter.text).to eq("Some quote")
    end
  end

  describe '#author' do
    it 'returns the quote author' do
      expect(@presenter.author).to eq("Some author")
    end
  end
end
