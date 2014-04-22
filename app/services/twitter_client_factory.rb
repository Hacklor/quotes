class TwitterClientFactory

  def self.get
    if ENV['RAILS_ENV'] == "production"
      Twitter::REST::Client.new do |config|
        config.consumer_key = TWITTER_CONFIG['twitter_consumer_key']
        config.consumer_secret = TWITTER_CONFIG['twitter_consumer_secret']
        config.access_token = TWITTER_CONFIG['twitter_access_token']
        config.access_token_secret = TWITTER_CONFIG['twitter_access_token_secret']
      end
    else
      LoggedTwitterClient.new(Rails.logger)
    end
  end

end
