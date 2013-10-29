class Quote < ActiveRecord::Base

  attr_accessor :name, :description

  def self.random
    offset = rand(Quote.count)
    Quote.offset(offset).first
  end

end
