require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Noel
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # true => /admin without being authed
    config.x.admin_panel_insecure = false
    # if user or password is nil, any login attempt will fail
    config.x.admin_panel_user = nil
    config.x.admin_panel_password = nil
  end
end
