require 'spec_helper'

describe Quote do

  it { should validate_presence_of :author }
  it { should validate_presence_of :text }

  describe '.random' do

    it 'returns a random quote' do
      quote1 = Quote.create!(:author => 'Author 1', :text => 'Quote Description 1')
      quote2 = Quote.create!(:author => 'Author 2', :text => 'Quote Description 2')
      quote3 = Quote.create!(:author => 'Author 3', :text => 'Quote Description 3')

      random_quote = Quote.random

      expect([quote1, quote2, quote3]).to include(random_quote)
    end

  end

  describe '#valid_total_length?' do

    it 'delegates to TweetFormatter' do
      tweet_formatter = double
      TweetFormatter.stub(:new).and_return(tweet_formatter)
      expect(tweet_formatter).to receive(:valid_length?)

      quote = Quote.new(author: "author", text: "text")
      expect(quote.valid?).to be_true
    end

  end

end
