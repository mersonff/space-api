# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root to: 'v1/home#index'

  namespace :v1, defaults: { format: :json } do
    resources :articles
  end
end
