require 'spec_helper'

describe QuotesController do

  describe 'GET /random_quotes' do

    let(:quote_presenter) { double('QuotePresenter') }

    it 'uses a quote presenter' do
      QuotePresenter.stub(:for).and_return(quote_presenter)

      get :random

      expect(assigns(:quote_presenter)).to eq(quote_presenter)
    end

    it 'generates a random quote' do
      quote = double('Quote')
      Quote.stub(:random).and_return(quote)
      QuotePresenter.stub(:for).with(quote).and_return(quote_presenter)

      get :random

      expect(assigns(:quote_presenter)).to eq(quote_presenter)
    end

    it 'generates a random image' do
      image_presenter = double
      LandscapeImagePresenter.stub(:new).and_return(image_presenter)

      get :random

      expect(assigns(:image_presenter)).to eq(image_presenter)
    end

  end

  describe '#show' do

    let(:quote) { double(id: '42') }
    let(:quote_presenter) { double }
    let(:image_presenter) { double }

    it 'assigns the quote presenter' do
      expect(Quote).to receive(:find_by).with(id: '42').and_return(quote)
      expect(QuotePresenter).to receive(:for).with(quote).and_return(quote_presenter)

      get :show, id: quote.id

      expect(assigns(:quote_presenter)).to eq(quote_presenter)
    end

    it 'assigns the image presenter' do
      Quote.stub(:find_by).and_return(quote)
      QuotePresenter.stub(:for).and_return(quote_presenter)
      expect(LandscapeImagePresenter).to receive(:new).and_return(image_presenter)

      get :show, id: quote.id

      expect(assigns(:image_presenter)).to eq(image_presenter)
    end

  end

end
