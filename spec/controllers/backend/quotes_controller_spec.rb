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

      context 'valid' do

        let!(:quote_params) { { "author" => "Albert Einstein",
                                "text" => "Insanity: doing the same thing over and over again and expecting different results." } }

        it 'saves the new quote' do
          expect {
            post :create, quote: quote_params
          }.to change { Quote.count } .by(1)
        end

        it 'redirects to index' do
          post :create, quote: quote_params

          expect(response).to redirect_to(backend_quotes_path)
        end

      end

      context 'invalid' do

        let!(:invalid_quote_params) { { "author" => "Albert Einstein",
                                        "text" => "" } }

        it 'renders new' do
          post :create, quote: invalid_quote_params
          expect(response).to render_template :new
        end

      end

    end

  end

end
