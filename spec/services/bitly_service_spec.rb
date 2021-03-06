require 'spec_helper_unit'
require 'bitly'

describe BitlyService do

  describe '#shorten' do

    let!(:bitly_client) { double }
    let!(:bitly_response) { double }
    let!(:subject) { BitlyService.new(bitly_client) }
    let(:long_url) { "http://www.someverylongurl.com/andevenlonger" }
    let(:short_url) { "http:://bit.ly/short" }

    context 'success' do

      it 'shortens an url' do
        expect(bitly_client).to receive(:shorten).with(long_url).and_return(bitly_response)
        expect(bitly_response).to receive(:short_url).and_return short_url

        expect(subject.shorten(long_url)).to eq(short_url)
      end

    end

    context 'error' do

      it 'returns a nil' do
        expect(bitly_client).to receive(:shorten).and_raise(BitlyError.new('INVALID_URI', 500))
        expect(subject.shorten(long_url)).to eq(nil)
      end

    end

  end

end
