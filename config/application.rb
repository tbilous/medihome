require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Medihome
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_spec: false,
                       helper_specs: false,
                       routing_specs: false,
                       request_specs: false,
                       controller_spec: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.template_engine :slim
    end

    # i18 config
    config.i18n.available_locales = [:uk, :en, :ru]
    config.i18n.default_locale = I18n.locale
  end
end
