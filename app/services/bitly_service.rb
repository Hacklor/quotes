class BitlyService

  def initialize(client = BitlyClientFactory.get)
    @client = client
  end

  def shorten(long_url)
    begin
      response = @client.shorten(long_url)
      response.short_url
    rescue
      nil
    end
  end

end
