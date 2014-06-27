class BitlyClientFactory

  def self.get
    if ENV['RAILS_ENV'] == 'production'
      Bitly.client
    else
      LoggedBitlyClient.new(Rails.logger)
    end
  end

end
