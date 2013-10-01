class QuotesController < ApplicationController

  def random
    @quote = Quote.first
  end

end
