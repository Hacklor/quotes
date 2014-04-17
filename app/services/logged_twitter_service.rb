class LoggedTwitterService

  attr_reader :logger
  def initialize(logger)
    @logger = logger
  end

  def tweet(text)
    logger.info("----- A tweet was sent -----")
    logger.info(text)
  end

end
