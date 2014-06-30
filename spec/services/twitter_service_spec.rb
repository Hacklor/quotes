require 'spec_helper_unit'
require 'twitter'

describe TwitterService do

  describe '#tweet' do

    let!(:twitter_client) { double }
    let!(:populate_tweet) { double }
    let!(:subject) { TwitterService.new(populate_tweet, twitter_client) }

    before do
      populate_tweet.stub(:text).and_return('tweet')
    end

    context 'succesfull tweet' do

      before do
        twitter_client.stub(:update).and_return(true)
      end

      it 'populates the tweet' do
        expect(populate_tweet).to receive(:text)
        subject.tweet
      end

      it 'tweets a text' do
        expect(twitter_client).to receive(:update).with('tweet')
        subject.tweet
      end

      it 'returns true' do
        success = subject.tweet
        expect(success).to be_true
      end

    end

    context 'an error occurred' do

      it 'returns false' do
        twitter_client.stub(:update).and_raise(Twitter::Error::Forbidden)
        expect(subject.tweet).to be_false
      end

      it 'remembers the error message' do
        exception = Twitter::Error::Forbidden.new
        exception.stub(:message).and_return('error')
        twitter_client.stub(:update).and_raise(exception)

        subject.tweet
        expect(subject.error_message).to eq('error')
      end

    end

  end

end
