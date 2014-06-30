require 'spec_helper'

describe TweetFormatter do

  describe '#formatted' do

    let!(:url) { "http://someurlxx.com" }
    subject(:formatter) { TweetFormatter.new(quote, url) }

    context 'short quote' do
      let(:quote) { double(author: 'a' * 5, text: 'b' * 100) }

      it 'formats the tweet with url' do
        expect(formatter.formatted).to eq("\"#{quote.text}\" - #{quote.author} (#{url})")
      end

    end

    context 'too long quote' do
      let(:quote) { double(author: 'a' * 5, text: 'b' * 130) }

      it 'truncates a long tweet' do
        expected_text = 'b' * 103

        expect(formatter.formatted.length).to eq(139)
        expect(formatter.formatted).to eq("\"#{expected_text}...\" - #{quote.author} (#{url})")
      end

    end

    context 'no url available' do

      let(:quote) { double(author: 'a' * 5, text: 'b' * 100) }

      it 'does not show the url' do
        formatter = TweetFormatter.new(quote, nil)
        expect(formatter.formatted).to eq("\"#{quote.text}\" - #{quote.author}")
      end

    end

  end

end
