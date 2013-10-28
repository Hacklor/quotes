class QuotesController < ApplicationController

  def random
    quote = Quote.random

    @quote_presenter = QuotePresenter.for(quote)
  end

end
