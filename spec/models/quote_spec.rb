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
      expect(TweetFormatter).to receive(:new).and_return(tweet_formatter)
      expect(tweet_formatter).to receive(:valid_length?)

      quote = Quote.create(author: "author", text: "text")
      expect(quote.errors[:total_length]).not_to be_nil
    end

  end

end
