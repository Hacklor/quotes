module Backend
  class TwitterController < ApplicationController

    layout 'backend'

    def tweet
      twitter_service = TwitterService.new
      tweet_formatter = TweetFormatter.new(quote)

      if twitter_service.tweet(tweet_formatter.formatted)
        flash[:notice] = "The quote has been tweeted"
      else
        flash[:error] = twitter_service.error_message
      end

      redirect_to backend_quotes_path
    end

    private

    def quote
      Quote.find(params[:quote_id])
    end

  end
end
