TWITTER_CONFIG = YAML.load_file('config/twitter.defaults.yml')[Rails.env]
user_twitter_config = YAML.load_file('config/twitter.yml')[Rails.env] || {} rescue {}
TWITTER_CONFIG.merge!(user_twitter_config)

BITLY_CONFIG = YAML.load_file('config/bitly.defaults.yml')[Rails.env]
user_bitly_config = YAML.load_file('config/bitly.yml')[Rails.env] || {} rescue {}
BITLY_CONFIG.merge!(user_bitly_config)
