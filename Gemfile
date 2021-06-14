source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# A web-application framework
gem 'rails', '~> 6.0.3.7'

# App server
gem 'puma', '~> 4.3.8'

# Actioncable server
gem 'anycable-rails', '~> 1.0'

# Database
gem 'active_record_extended'
gem 'after_commit_everywhere', '~> 1.0'
gem 'ancestry'
gem 'bcrypt'
gem 'bulk_insert'
gem 'connection_pool'
gem 'counter_culture', '~> 2.0'
gem 'discard', '~> 1.0'
gem 'enumerize'
gem 'file_validators'
gem 'groupdate'
gem 'hiredis'
gem 'pg'
gem 'rambling-trie'
gem 'redis-objects', github: 'nateware/redis-objects', ref: '2100417'

# Authorization
gem 'doorkeeper'
gem 'omniauth-github', '~> 2.0.0'
gem 'omniauth-rails_csrf_protection', '~> 1.0.0'

# HTTP client
gem 'socksify'
gem 'rest-client'

# integrate WeChat Official Accounts Platform or Wechat mini program easily
gem 'wechat', '~> 0.12.1'

# Payment
gem 'rqrcode'

# File uploader
gem 'carrierwave', '~> 1.3.2'
gem 'carrierwave-upyun', '~> 0.2.2'

# I18n and L10n
gem 'carrierwave-i18n'
gem 'rails-i18n', '~> 6.0.0'

# Asset Pipeline
gem 'sass-rails', '>= 6.0.0'
gem 'webpacker', '~> 5.0.1'
gem 'sprockets', '~> 3.7'

# View
gem 'active_link_to', '~> 1.0'
gem 'bootstrap_form', '>= 4.2.0'
gem 'browser_warrior', '>= 0.12.0'
gem 'chartkick', '>= 3.3.0'
gem 'gon', '~> 6.4'
gem 'jbuilder', '~> 2.5'
gem 'jb'
gem 'kaminari', '~> 1.2.1'
gem 'ot'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'safe_target_blank'
gem 'simple_form', '~> 5.0'
gem 'slim-rails'
gem 'turbolinks', '~> 5'  

# Pages
gem 'high_voltage'
gem 'rouge'
gem 'redcarpet', '>= 3.5'

# Configuration
gem 'figaro'

# Exception notification

# An attempt to tame Rails' default policy to log everything.
gem 'lograge', github: 'dao42/lograge'
gem 'logstash-event'

# APM agent
# gem 'elastic-apm'

# Deployment
gem 'daemons'
gem 'ed25519', '>= 1.2', '< 2.0'
gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'

# SEO
gem 'meta-tags'
gem 'sitemap_generator'

# Security
gem 'rack-attack'

# Removes invalid UTF-8 characters from the environment so that your app doesn't choke on them.
gem 'utf8-cleaner'

# Boot large Ruby/Rails apps faster
gem 'bootsnap', '>= 1.4.6', require: false

# Performance and memory metrics toolkits
gem 'process-metrics', require: false
gem 'rbtrace'
gem 'stackprof', require: false

group :development do
  gem 'amazing_print'
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'bundler-audit', require: false
  gem 'listen', '>= 3.0.5', '< 4.0'
  gem 'guard', require: false
  gem 'guard-rspec', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubycritic', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 4.0.1'
  gem 'capistrano', '~> 3.14', require: false
  gem 'capistrano-rails', '~> 1.6', require: false
  gem 'capistrano-rbenv', '~> 2.2', require: false
  gem 'capistrano-sidekiq', require: false
  gem 'capistrano-clockwork', require: false
  gem 'capistrano-anycable', require: false
  gem 'capistrano3-puma', require: false
end

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails', '5.1.1'
  gem 'fakeredis', require: 'fakeredis/rspec'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock', require: 'webmock/rspec'
end
