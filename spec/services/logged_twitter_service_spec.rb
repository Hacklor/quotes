require 'spec_helper_unit'

describe LoggedTwitterService do

  let!(:logger) { double }
  let!(:subject) { LoggedTwitterService.new(logger) }

  describe '#tweet' do

    it 'tweets a text' do
      expect(logger).to receive(:info).with("----- A tweet was sent -----")
      expect(logger).to receive(:info).with("tweet")
      subject.tweet("tweet")
    end
  end

end
