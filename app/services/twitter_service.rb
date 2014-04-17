class TwitterService

  attr_reader :client
  def initialize(client = TwitterClientFactory.get)
    @client = client
  end

  def tweet(text)
    client.update(text)
  end

end
