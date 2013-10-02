require 'spec_helper'

describe '#show_quote' do
  context 'no quote is given' do
    it 'returns that there is no quote available' do
      quote_message = helper.show_quote(nil)
      expect(quote_message).to eq('There are no quotes available')
    end
  end

  context 'a quote is given' do
    it 'returns the text and author' do
      quote = double('Quote', text: Faker::Lorem.sentence, author: Faker::Name.name)

      quote_message = helper.show_quote(quote)
      expect(quote_message).to eq("<div id=\"quote\">#{quote.text}</div><div id=\"author\">#{quote.author}</div>")
    end
  end
end
