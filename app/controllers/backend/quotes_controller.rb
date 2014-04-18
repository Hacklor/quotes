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
        flash[:error] = @quote.errors.full_messages.to_sentence
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
        flash[:error] = @quote.errors.full_messages.to_sentence
        render :edit
      end
    end

    def destroy
      quote.destroy
      redirect_to backend_quotes_path
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
