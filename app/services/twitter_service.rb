class TwitterService

  attr_reader :error_message
  def initialize(populate_tweet, client = TwitterClientFactory.get)
    @populate_tweet = populate_tweet
    @client = client
  end

  def tweet
    begin
      text = @populate_tweet.text
      @client.update(text)
      true
    rescue Twitter::Error => error
      @error_message = error.message
      false
    end
  end

end
