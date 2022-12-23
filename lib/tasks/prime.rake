# frozen_string_literal: true

if Rails.env.development? || Rails.env.test?
  namespace :dev do
    desc 'Consome a API e cria os registros no banco de dados'
    task prime: :environment do
      ConsumingApiService.new(20_000).persist_data
    end
  end
end
