module Backend

  class QuotesController < ApplicationController

    def index
      @quotes_presenter = QuotesPresenter.for(Quote.all)
    end

    def new
      @quote = Quote.new
    end

    def create
      @quote = Quote.new(quote_params)
      @quote.save

      redirect_to backend_quotes_path
    end

    private

    def quote_params
      params.require(:quote).permit(:author, :text)
    end

  end

end
