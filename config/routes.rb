# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    get 'home' => 'home#index'
    resources :articles
  end
end
