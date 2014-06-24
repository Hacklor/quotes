class QuotesController < ApplicationController

  def random
    quote = Quote.random

    assign_presenters(quote)
  end

  def show
    quote = Quote.find_by(id: params[:id])

    assign_presenters(quote)
  end

  private

  def assign_presenters(quote)
    @quote_presenter = QuotePresenter.for(quote)
    @image_presenter = LandscapeImagePresenter.new
  end

end
