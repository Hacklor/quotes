class LoggedTwitterClient

  attr_reader :logger
  def initialize(logger)
    @logger = logger
  end

  def update(text)
    logger.info("----- A tweet was sent -----")
    logger.info(text)
  end

end
