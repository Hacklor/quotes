class QuotesController < ApplicationController

  def random
    quote = Quote.random

    @quote_presenter = QuotePresenter.for(quote)
    @image_presenter = ImagePresenter.new
  end

end
