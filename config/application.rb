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

    config.twitter_consumer_key = "dDZPL5SYIOh6gdeVUYraehTNh"
    config.twitter_consumer_secret = "Jq24Bjgxi5NYFDuIG5DJZGgRqOa69FkXdOtxCfqcmruobojMFi"
    config.twitter_access_token = "2445981690-NIPqQld7xSsh62REp2rpUbB5Gz7mNWqaA1jn0ST"
    config.twitter_access_token_secret = "c85Txpmw3t9GGkk28Hak7fZG4OpC697CyFS4fG8Hg1HSJ"
  end
end
