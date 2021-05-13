require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rabbit
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.load_defaults 5.2

    Rails.application.config.assets.paths << Rails.root.join('vendor', 'javascripts')
    Rails.application.config.assets.paths << Rails.root.join('vendor', 'stylesheets')
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
