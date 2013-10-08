require 'spec_helper'

describe QuotesController do
  describe 'GET /random_quotes' do
    it 'uses a quote presenter' do
      quote_presenter = double('QuotePresenter')
      QuotePresenter.stub(:for).and_return(quote_presenter)

      get :random
      expect(assigns(:quote)).to be(quote_presenter)
    end
  end
end
