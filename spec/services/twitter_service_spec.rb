require 'spec_helper_unit'

describe TwitterService do

  describe '#tweet' do

    let!(:twitter_client) { double }
    let!(:subject) { TwitterService.new(twitter_client) }

    it 'tweets a text' do
      expect(twitter_client).to receive(:update).with("tweet")
      subject.tweet("tweet")
    end

  end
end
