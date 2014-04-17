require 'spec_helper_unit'

describe LoggedTwitterClient do

  let!(:logger) { double }
  let!(:subject) { LoggedTwitterClient.new(logger) }

  describe '#tweet' do

    it 'tweets a text' do
      expect(logger).to receive(:info).with("----- A tweet was sent -----")
      expect(logger).to receive(:info).with("tweet")
      subject.update("tweet")
    end
  end

end
