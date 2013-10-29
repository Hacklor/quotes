require 'spec_helper'

describe Quote do

  describe '#random' do

    it 'returns a random quote' do
      quote1 = Quote.create!(:name => 'Quote 1', :description => 'Quote Description 1')
      quote2 = Quote.create!(:name => 'Quote 2', :description => 'Quote Description 2')
      quote3 = Quote.create!(:name => 'Quote 3', :description => 'Quote Description 3')

      random_quote = Quote.random

      expect([quote1, quote2, quote3]).to include(random_quote)
    end

  end

end
