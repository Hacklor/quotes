module Backend
  class QuotesController < ApplicationController

    layout 'backend'

    def index
      @quotes_presenter = QuotesPresenter.for(Quote.all)
    end

    def new
      @quote = Quote.new
    end

    def create
      @quote = Quote.new(quote_params)
      if @quote.save
        redirect_to backend_quotes_path
      else
        render :new
      end
    end

    private

    def quote_params
      params.require(:quote).permit(:author, :text)
    end

  end
end
