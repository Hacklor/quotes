require 'spec_helper'

describe Quote do

  it { should validate_presence_of :author }
  it { should validate_presence_of :text }

  describe '.random' do

    it 'returns a random quote' do
      quote1 = Quote.create!(:author => 'Author 1', :text => 'Quote Description 1')
      quote2 = Quote.create!(:author => 'Author 2', :text => 'Quote Description 2')
      quote3 = Quote.create!(:author => 'Author 3', :text => 'Quote Description 3')

      random_quote = Quote.random

      expect([quote1, quote2, quote3]).to include(random_quote)
    end

  end

end
