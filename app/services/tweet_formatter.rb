class TweetFormatter

  def initialize(quote)
    @quote = quote
  end

  def formatted
    @formatted ||= "\"#{@quote.text}\" - #{@quote.author}"
  end

  def valid_length?
    formatted.length <= 140
  end
end
