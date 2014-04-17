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

module Quotes
  class Application < Rails::Application
    config.i18n.enforce_available_locales = false

    config.twitter_consumer_key = "1COv2HANqbRr5In24jdA9cuJ7"
    config.twitter_consumer_secret = "lrcerG9N08ujlKHx5ZG0Q8uZTDMu5ugGdzAJcU48BNkgXa0xIB"
    config.twitter_access_token = "2445981690-QAQJGqefqlGx7JY1RYAOSJs17ALH3uj4w0kAT0O"
    config.twitter_access_token_secret = "Aa9bW09D2bBrBAaIJZefwAhA4nMYJosOwiOjzSh45rNGd"
  end
end
