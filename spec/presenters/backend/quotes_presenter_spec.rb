require 'spec_helper'

module Backend

  describe QuotesPresenter do

    describe '#has_quotes?' do
      let!(:quotes) { [] }
      let!(:presenter) { QuotesPresenter.for(quotes) }

      it 'returns false when there are no quotes' do
        expect(presenter.has_quotes?).to be_false
      end

      it 'returns true when there are quotes' do
        quotes << double('Quote')
        expect(presenter.has_quotes?).to be_true
      end
    end

    describe '#each' do
      let!(:quote) { double(Quote) }
      let!(:quotes) { [quote] }

      it 'return a quote_presenter' do
        QuotePresenter.should_receive(:for).with(quote)

        QuotesPresenter.for(quotes).each {}
      end

    end
  end

end
