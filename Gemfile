source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'foreman', groups: 'cli'

# slim
gem 'slim'
gem 'slim-rails'

# i18n
gem 'rails-i18n'

# authorization
gem 'devise'
gem 'devise-i18n'
gem 'omniauth'
gem 'omniauth-facebook'

gem 'will_paginate'


# js
gem 'gon'

# data
gem 'responders'
gem 'active_model_serializers'

# Frontend framework
gem 'materialize-sass'
gem 'material_icons'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rails-controller-testing'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'timecop'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'rack-livereload'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'guard-bundler', require: false
  gem 'guard-livereload', require: false
  gem 'guard-rails', require: false
  gem 'guard-rspec', require: false
  gem 'guard-spring', require: false
  gem 'terminal-notifier-guard', require: false
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'capybara-email'
  gem 'launchy'
  gem 'poltergeist'
  gem 'rspec-rails'
  gem 'selenium-webdriver', '2.53.4'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
  gem 'json_spec'
  gem 'fuubar'
  gem 'rspec-page-regression', github: 'teachbase/rspec-page-regression', branch: 'use-imatcher'
  gem 'rack_session_access'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
