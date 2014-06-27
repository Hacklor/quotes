require 'spec_helper_unit'

describe PopulateTweet do

  describe '#text' do

    let!(:quote) { double }
    let!(:long_url) { 'http://www.averylongurlwewantshortened.com' }
    let!(:short_url) { 'http://bit.ly/short' }
    let!(:bitly_service) { double }
    let!(:tweet_formatter) { double }

    it 'returns the text to be tweeted' do
      expect(BitlyService).to receive(:new).and_return(bitly_service)
      expect(bitly_service).to receive(:shorten).with(long_url).and_return(short_url)
      expect(TweetFormatter).to receive(:new).with(quote, short_url).and_return(tweet_formatter)
      expect(tweet_formatter).to receive(:formatted).and_return("Tweet!")

      populate_tweet = PopulateTweet.new(quote, long_url)
      expect(populate_tweet.text).to eq("Tweet!")
    end

  end

end
