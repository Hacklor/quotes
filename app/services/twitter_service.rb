class TwitterService

  attr_reader :client
  def initialize(client)
    @client = client
  end

  def tweet(text)
    client.update(text)
  end

end
