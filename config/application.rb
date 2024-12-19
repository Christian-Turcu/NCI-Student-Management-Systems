require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems

Bundler.require(*Rails.groups)

module CloudApppnci
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    config.autoload_lib(ignore: %w[assets tasks])

  end
end
