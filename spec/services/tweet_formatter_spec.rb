require 'spec_helper_unit'

describe TweetFormatter do

  describe '#formatted' do

    subject(:formatter) { TweetFormatter.new(quote) }

    context 'short quote' do
      let(:quote) { double(author: 'Albert Einstein', text: 'Insanity: doing the same thing over and over again and expecting different results.') }

      it 'formats the tweet' do
        expect(formatter.formatted).to eq("\"#{quote.text}\" - #{quote.author}")
      end
    end

    context 'too long quote' do
      let(:quote) { double(author: 'a' * 5, text: 'b' * 131) }

      it 'truncates a long tweet' do
        expected_text = 'b' * 127

        expect(formatter.formatted.length).to eq(140)
        expect(formatter.formatted).to eq("\"#{expected_text}...\" - #{quote.author}")
      end

    end

  end

end
