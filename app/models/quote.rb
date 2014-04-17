class Quote < ActiveRecord::Base

  validates :author, :text, presence: true

  def self.random
    offset = rand(Quote.count)
    Quote.offset(offset).first
  end

end
