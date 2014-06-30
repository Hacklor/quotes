require 'spec_helper'

describe BitlyClientFactory do

  describe '.get' do

    context 'development' do

      it 'returns a fake service' do
        ENV['RAILS_ENV'] = 'development'
        client = BitlyClientFactory.get
        expect(client.is_a?(LoggedBitlyClient)).to be_true
      end

    end

    context 'test' do

      it 'returns a fake service' do
        ENV['RAILS_ENV'] = 'test'
        client = BitlyClientFactory.get
        expect(client.is_a?(LoggedBitlyClient)).to be_true
      end

    end

    context 'production' do

      it 'returns a real service' do
        ENV['RAILS_ENV'] = 'production'
        client = BitlyClientFactory.get
        expect(client.is_a?(Bitly::V3::Client)).to be_true
      end

    end

  end

end
