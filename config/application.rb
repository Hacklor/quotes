require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

# Load the twitter configuration yml file
TWITTER_CONFIG = YAML.load_file('config/twitter.defaults.yml')[Rails.env]
user_twitter_config = YAML.load_file('config/twitter.yml')[Rails.env] rescue {}
TWITTER_CONFIG.merge!(user_twitter_config)

module Quotes
  class Application < Rails::Application
    config.i18n.enforce_available_locales = false
  end
end
