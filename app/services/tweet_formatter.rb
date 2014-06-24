class TweetFormatter

  MAX_TWEET_LENGTH = 140
  TRUNCATION_CHARACTERS = "...".freeze

  def initialize(quote)
    @quote = quote
  end

  def formatted
    author_text = " - #{@quote.author}"
    quote_text = quote_text(MAX_TWEET_LENGTH - author_text.length)

    "#{quote_text}#{author_text}"
  end

  private

  def quote_text(max_quote_text_length)
    max_quote_text_length -= 2
    quote_text = @quote.text

    if quote_text.length > max_quote_text_length
      quote_text = truncated_quote_text(max_quote_text_length)
    end

    %{"#{quote_text}"}
  end

  def truncated_quote_text(max_quote_text_length)
    truncation_position = max_quote_text_length - TRUNCATION_CHARACTERS.length
    @quote.text[0...truncation_position] + TRUNCATION_CHARACTERS
  end

end
