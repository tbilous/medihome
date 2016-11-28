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
# slim
gem 'slim'
gem 'slim-rails'

# i18n
gem 'rails-i18n'

# authorization
gem 'devise'
gem 'devise-i18n'

gem 'will_paginate'
gem 'foreman', groups: 'cli'

gem 'responders'

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
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring-commands-rspec'
  gem 'guard-bundler', require: false
  gem 'guard-rails', require: false
  gem 'guard-rspec', require: false
  gem 'guard-spring', require: false
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
  gem 'terminal-notifier-guard', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'launchy'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
  gem 'poltergeist'

  gem 'database_cleaner'
  gem 'email_spec'
  gem 'json_spec'
  gem 'fuubar'
  gem 'rspec-page-regression', github: 'teachbase/rspec-page-regression', branch: 'use-imatcher'
  gem 'rack_session_access'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
