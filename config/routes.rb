require 'sidekiq/web'
require 'sidekiq-status/web'
require 'sidekiq_unique_jobs/web'
Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]

Rails.application.routes.draw do
  root to: 'home#index'
end
