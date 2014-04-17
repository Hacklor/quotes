require 'spec_helper'

module Backend

  describe TwitterController do

    describe '#tweet' do

      let!(:quote) { double(author: "author", text: "text") }
      let!(:twitter_service) { double }

      before do
        Quote.stub(:find).and_return(quote)
        TwitterService.stub(:new).and_return(twitter_service)
        twitter_service.stub(:tweet)
      end

      it 'finds the quote' do
        expect(Quote).to receive(:find).with('1').and_return(quote)
        post :tweet, quote_id: '1'
      end

      it 'tweets te quote' do
        twitter_service = double
        expect(TwitterService).to receive(:new).and_return(twitter_service)
        expect(twitter_service).to receive(:tweet).with(quote.text)

        post :tweet, quote_id: '1'
      end

      it 'sets a flash notification' do
        post :tweet, quote_id: '1'
        expect(flash[:notice]).to eq("The quote has been tweeted")
      end

      it 'redirects to quotes index' do
        post :tweet, quote_id: '1'
        expect(response).to redirect_to(backend_quotes_path)
      end

    end

  end

end
