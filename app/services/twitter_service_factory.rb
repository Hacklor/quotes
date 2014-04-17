class TwitterServiceFactory

  def self.get
    if ENV['RAILS_ENV'] == "production"
      Twitter::REST::Client.new do |config|
        config.consumer_key = ""
        config.consumer_secret = ""
        config.access_token = ""
        config.access_token_secret = ""
      end
    else
      LoggedTwitterService.new(Rails.logger)
    end
  end

end
