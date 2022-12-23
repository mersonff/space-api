# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :v1, defaults: { format: :json } do
    get 'home' => 'home#index'
    resources :articles
  end
end
