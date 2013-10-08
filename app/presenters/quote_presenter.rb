class QuotePresenter

  def self.for(quote)
    new(quote)
  end

  attr_reader :quote

  def initialize(quote)
    @quote = quote
  end

  def has_quote?
    quote
  end

  def text
    @quote.text
  end

  def author
    @quote.author
  end
end
