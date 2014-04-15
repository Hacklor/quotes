require 'spec_helper'

module Backend

  describe QuotesController do

    describe '#index' do

      let!(:quotes_presenter) { double('QuotesPresenter') }

      it 'gets a list of quotes with quotes presenter' do
        quotes = []
        Quote.should_receive(:all).and_return(quotes)
        QuotesPresenter.should_receive(:for).with(quotes).and_return(quotes_presenter)

        get :index

        expect(assigns(:quotes_presenter)).to be(quotes_presenter)
      end

    end

    describe "#new" do

      it 'assigns a new quote' do
        quote = double
        expect(Quote).to receive(:new).and_return(quote)

        get :new

        expect(assigns(:quote)).to eq(quote)
      end

    end

    describe "#create" do
    end

  end

end
