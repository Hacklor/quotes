require 'spec_helper'

describe QuotesController do

  describe 'GET /random_quotes' do

    let(:quote_presenter) { double('QuotePresenter') }

    it 'uses a quote presenter' do
      QuotePresenter.stub(:for).and_return(quote_presenter)

      get :random

      expect(assigns(:quote_presenter)).to be(quote_presenter)
    end

    it 'generates a random quote' do
      quote = double('Quote')
      Quote.stub(:random).and_return(quote)
      QuotePresenter.stub(:for).with(quote).and_return(quote_presenter)

      get :random

      expect(assigns(:quote_presenter)).to be(quote_presenter)
    end

  end

end
