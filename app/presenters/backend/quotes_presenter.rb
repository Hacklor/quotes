module Backend

  class QuotesPresenter

    def self.for(quotes)
      QuotesPresenter.new(quotes)
    end

    attr_reader :quotes

    def initialize(quotes)
      @quotes = quotes
    end

    def has_quotes?
      !quotes.empty?
    end

    def each(&block)
      index = 0
      while index < quotes.size
        quote_presenter = QuotePresenter.for(quotes[index])
        block.call(quote_presenter)
        index += 1
      end
    end

  end
end
