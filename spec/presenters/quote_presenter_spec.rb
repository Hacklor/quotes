require 'spec_helper'

describe QuotePresenter do

  before :each do
    quote = Quote.new(:text => "Some quote", :author => "Some author")
    @presenter = QuotePresenter.for(quote)
    p "Presenter: #{@presenter}"
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
