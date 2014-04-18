class TwitterService

  attr_reader :client, :error_message
  def initialize(client = TwitterClientFactory.get)
    @client = client
  end

  def tweet(text)
    begin
      client.update(text)
      true
    rescue Twitter::Error => error
      @error_message = error.message
      false
    end
  end

end
