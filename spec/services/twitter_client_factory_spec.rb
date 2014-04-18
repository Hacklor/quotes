require 'spec_helper'

describe TwitterClientFactory do

  describe '#get' do

    context 'development' do

      it 'returns a fake service' do
        ENV['RAILS_ENV'] = "development"
        service = TwitterClientFactory.get
        expect(service.is_a?(LoggedTwitterClient)).to be_true
      end

    end

    context 'test' do

      it 'returns a fake service' do
        ENV['RAILS_ENV'] = "test"
        service = TwitterClientFactory.get
        expect(service.is_a?(LoggedTwitterClient)).to be_true
      end

    end

    context 'production' do

      it 'returns the real service' do
        ENV['RAILS_ENV'] = "production"
        service = TwitterClientFactory.get
        expect(service.is_a?(Twitter::REST::Client)).to be_true
      end

    end
  end

end
