require 'spec_helper_unit'
require 'twitter'

describe TwitterService do

  describe '#tweet' do

    let!(:twitter_client) { double }
    let!(:subject) { TwitterService.new(twitter_client) }

    context 'succesfull tweet' do

      it 'tweets a text' do
        expect(twitter_client).to receive(:update).with("tweet")
        subject.tweet("tweet")
      end

      it 'returns true' do
        twitter_client.stub(:update)
        success = subject.tweet("tweet")
        expect(success).to be_true
      end

    end

    context 'an error occurred' do

      it 'returns false' do
        twitter_client.stub(:update).and_raise(Twitter::Error::Forbidden)
        success = subject.tweet("tweet")
        expect(success).to be_false
      end

      it 'remembers the error message' do
        exception = Twitter::Error::Forbidden.new
        exception.stub(:message).and_return('error')
        twitter_client.stub(:update).and_raise(exception)

        subject.tweet("tweet")
        expect(subject.error_message).to eq('error')
      end

    end

  end

end
