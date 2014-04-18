require 'spec_helper'

module Backend

  describe TwitterController do

    describe '#tweet' do

      let!(:quote) { double(author: "author", text: "text") }
      let!(:twitter_service) { double }
      let!(:tweet_formatter) { double }

      before do
        Quote.stub(:find).and_return(quote)
        TweetFormatter.stub(:new).with(quote).and_return(tweet_formatter)
        tweet_formatter.stub(:formatted).and_return("Tweet!")
        TwitterService.stub(:new).and_return(twitter_service)
        twitter_service.stub(:tweet).and_return(true)
      end

      it 'finds the quote' do
        expect(Quote).to receive(:find).with('1').and_return(quote)
        post :tweet, quote_id: '1'
      end

      it 'redirects to quotes index' do
        post :tweet, quote_id: '1'
        expect(response).to redirect_to(backend_quotes_path)
      end

      context 'successfull tweet' do

        it 'tweets the quote' do
          expect(tweet_formatter).to receive(:formatted).and_return("Tweet!")
          expect(TwitterService).to receive(:new).and_return(twitter_service)
          expect(twitter_service).to receive(:tweet).with("Tweet!")

          post :tweet, quote_id: '1'
        end

        it 'sets a flash notification' do
          post :tweet, quote_id: '1'
          expect(flash[:notice]).to eq("The quote has been tweeted")
        end

      end

      context 'an error occurred' do

        it 'sets an error notification' do
          twitter_service.stub(:tweet).and_return(false)
          expect(twitter_service).to receive(:error_message).and_return("Status is over 140 characters.")

          post :tweet, quote_id: '1'
          expect(flash[:error]).to eq("Status is over 140 characters.")
        end

      end

    end

  end

end
