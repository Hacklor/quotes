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

    def edit
      quote
    end

    def update
      if quote.update(quote_params)
        redirect_to backend_quotes_path
      else
        render :edit
      end
    end

    private

    def quote_params
      params.require(:quote).permit(:author, :text)
    end

    def quote
      @quote ||= Quote.find(params[:id])
    end

  end
end
