class QuotesController < ApplicationController


  Quote = Struct.new :description, :author do
    attr_reader :description, :author
  end

  def random
    @quote = Quote.new(
      "Don't cry because it's over, smile because it happened.",
      "Dr. Seuss")
  end

end
