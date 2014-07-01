Bitly.configure do |config|
  config.api_version = 3
  config.login = BITLY_CONFIG['bitly_login']
  config.api_key = BITLY_CONFIG['bitly_api_key']
end
