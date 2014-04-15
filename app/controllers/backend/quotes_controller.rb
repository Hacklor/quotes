module Backend

  class QuotesController < ApplicationController

    def index
      @quotes_presenter = QuotesPresenter.for(Quote.all)
    end

    def new
      @quote = Quote.new
    end

    def create
    end

  end

end
