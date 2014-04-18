class Quote < ActiveRecord::Base

  validates :author, :text, presence: true
  validate :valid_total_length?

  def self.random
    offset = rand(Quote.count)
    Quote.offset(offset).first
  end

  private

  def valid_total_length?
    tweet_formatter = TweetFormatter.new(self)
    unless tweet_formatter.valid_length?
      errors[:total_length] = "can't be more than 140 characters"
    end
  end

end
