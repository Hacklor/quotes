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

      let!(:quote) { double }

      before do
        Quote.stub(:new).and_return(quote)
      end

      context 'valid' do

        let!(:quote_params) { { "author" => "Albert Einstein",
                                "text" => "Insanity: doing the same thing over and over again and expecting different results." } }

        before do
          quote.stub(:save).and_return(true)
        end

        it 'saves the new quote' do
          expect(Quote).to receive(:new).with(quote_params).and_return(quote)
          expect(quote).to receive(:save)

          post :create, quote: quote_params
        end

        it 'redirects to index' do
          post :create, quote: quote_params

          expect(response).to redirect_to(backend_quotes_path)
        end

      end

      context 'invalid' do

        let!(:invalid_quote_params) { { "author" => "Albert Einstein",
                                        "text" => "" } }

        before do
          quote.stub(:save).and_return(false)
          quote.stub_chain(:errors, :full_messages, :to_sentence).and_return("An error")
        end

        it 'renders new' do
          post :create, quote: invalid_quote_params
          expect(response).to render_template :new
        end

        it 'shows a flash error' do
          expect(quote).to receive(:errors)
          post :create, quote: invalid_quote_params
          expect(flash[:error]).not_to be_nil
        end

      end

    end

    describe '#edit' do

      it 'assigns an existing quote' do
        quote = double
        expect(Quote).to receive(:find).with('1').and_return(quote)

        get :edit, id: '1'

        expect(assigns(:quote)).to eq(quote)
      end

    end

    describe '#update' do

      let!(:quote) { double }

      before do
        expect(Quote).to receive(:find).with('1').and_return(quote)
        quote.stub(:update).and_return(true)
      end

      context 'valid' do

        let!(:quote_params) { { "author" => "Albert Einstein",
                                "text" => "Insanity: doing the same thing over and over again and expecting different results." } }

        it 'finds the exising quote' do
          expect(quote).to receive(:update).with(quote_params).and_return(true)
          put :update, id: '1', quote: quote_params
        end

        it 'redirects to index' do
          put :update, id: '1', quote: quote_params
          expect(response).to redirect_to(backend_quotes_path)
        end

      end

      context 'invalid' do

        let!(:invalid_quote_params) { { "author" => "Albert Einstein",
                                        "text" => "" } }

        before do
          quote.stub(:update).and_return(false)
          quote.stub_chain(:errors, :full_messages, :to_sentence).and_return(["Something went wrong"])
        end

        it 'renders edit' do
          put :update, id: '1', quote: invalid_quote_params
          expect(response).to render_template :edit
        end

        it 'shows a flash error' do
          put :update, id: '1', quote: invalid_quote_params
          expect(flash[:error]).not_to be_nil
        end

      end

    end

    describe '#destroy' do

      let!(:quote) { double }

      before do
        expect(Quote).to receive(:find).with('1').and_return(quote)
      end

      it 'deletes the quote' do
        expect(quote).to receive(:destroy)
        delete :destroy, id: '1'
      end

      it 'redirects to index' do
        quote.stub(:destroy)
        delete :destroy, id: '1'
        expect(response).to redirect_to(backend_quotes_path)
      end

    end

  end

end
