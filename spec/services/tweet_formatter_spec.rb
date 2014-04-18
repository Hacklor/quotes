require 'spec_helper_unit'

describe TweetFormatter do


  describe '#formatted' do

    let!(:quote) { double(author: "Albert Einstein",
                          text: "Insanity: doing the same thing over and over again and expecting different results.") }

    it 'formats the tweet' do
      formatter = TweetFormatter.new(quote)
      expect(formatter.formatted).to eq("\"#{quote.text}\" - #{quote.author}")
    end

  end

  describe "#valid_length?" do

    let!(:quote) { double(author: "", text: "") }
    let!(:formatter) { TweetFormatter.new(quote) }

    context 'valid' do

      it 'returns true with length of 139 characters' do
        5.times { quote.author << "a" }
        129.times { quote.text << "b" }
        expect(formatter.valid_length?).to be_true
      end

      it 'returns true with length of 140 characters' do
        5.times { quote.author << "a" }
        130.times { quote.text << "b" }
        expect(formatter.valid_length?).to be_true
      end

    end

    context 'invalid' do

      it 'returns false with length of 141 characters' do
        5.times { quote.author << "a" }
        131.times { quote.text << "b" }
        expect(formatter.valid_length?).to be_false
      end

    end

  end

end
