LoggedBitlyResponse = Struct.new(:short_url)

class LoggedBitlyClient

  def initialize(logger)
    @logger = logger
  end

  def shorten(long_url)
    @logger.info("----- A url was shortened -----")
    @logger.info(long_url)
    LoggedBitlyResponse.new(long_url)
  end

end
