require 'spec_helper_unit'

describe LoggedBitlyClient do

  let!(:logger) { double }
  let!(:subject) { LoggedBitlyClient.new(logger) }
  let!(:long_url) { "http://www.alongurl.com" }

  describe '#shorten' do

    it 'logs the url to be shortened' do
      expect(logger).to receive(:info).with("----- A url was shortened -----")
      expect(logger).to receive(:info).with(long_url)

      response = subject.shorten(long_url)
      expect(response.short_url).to eq(long_url)
    end
  end

end
