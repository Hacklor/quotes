class BitlyService

  def initialize(client = BitlyClientFactory.get)
    @client = client
  end

  def shorten(long_url)
    response = @client.shorten(long_url)
    response.short_url
  end

end
