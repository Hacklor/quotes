class QuotesController < ApplicationController

  def random
    quote = Quote.first
    @quote = QuotePresenter.for(quote)
  end

end
