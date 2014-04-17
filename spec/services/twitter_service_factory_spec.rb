require 'spec_helper_unit'
require 'twitter'

describe TwitterServiceFactory do

  describe '#get' do

    context 'development' do

      it 'returns a fake service' do
        ENV['RAILS_ENV'] = "development"
        service = TwitterServiceFactory.get
        expect(service.is_a?(LoggedTwitterService)).to be_true
      end

    end

    context 'test' do

      it 'returns a fake service' do
        ENV['RAILS_ENV'] = "test"
        service = TwitterServiceFactory.get
        expect(service.is_a?(LoggedTwitterService)).to be_true
      end

    end

    context 'production' do

      it 'returns the real service' do
        ENV['RAILS_ENV'] = "production"
        service = TwitterServiceFactory.get
        expect(service.is_a?(Twitter::REST::Client)).to be_true
      end

    end
  end

end
