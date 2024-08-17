require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Gerenciador
  class Application < Rails::Application

    config.load_defaults 7.2

    config.autoload_lib(ignore: %w[assets tasks])

    #Set time zone
    config.time_zone = 'Brasilia'

    #Set default locale
    config.i18n.default_locale = 'pt-BR'

    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
   
  end
end
