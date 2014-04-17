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
      quotes.each do |quote|
        yield QuotePresenter.for(quote)
      end
    end

  end
end
