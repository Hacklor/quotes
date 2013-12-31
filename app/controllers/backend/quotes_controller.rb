module Backend

  class QuotesController < ApplicationController

    def index
      @quotes_presenter = QuotesPresenter.for(Quote.all)
    end

  end

end
