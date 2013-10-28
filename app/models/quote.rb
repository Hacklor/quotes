class Quote < ActiveRecord::Base

  def self.random
    Quote.first
  end
end
