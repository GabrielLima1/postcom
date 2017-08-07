require_relative 'boot'

require 'rails/all'
ENV['RAILS_ADMIN_THEME'] = 'rollincode'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Postcom3
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Brasilia'
    config.i18n.load_path += Dir[Rails.root.join("config/locales/**/*.{rb,yml}").to_s]
    config.i18n.default_locale = "pt-BR"
    config.encoding = "utf-8"
    config.filter_parameters += [:password, :password_confirmation]
    config.eager_load_paths += Dir["#{config.root}/lib/**/"]
    config.autoload_paths += %W(
    #{config.root}/lib
    #{config.root}/app/controllers/concerns
    #{config.root}/app/models/concerns
    #{config.root}/app/services
    )
  end
end
