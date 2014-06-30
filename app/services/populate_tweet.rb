class PopulateTweet

  def initialize(quote, long_url)
    @bitly_service = BitlyService.new

    @quote = quote
    @long_url = long_url
  end

  def text
    short_url = @bitly_service.shorten(@long_url)

    formatter = TweetFormatter.new(@quote, short_url)
    formatter.formatted
  end

end
