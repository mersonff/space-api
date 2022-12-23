# frozen_string_literal: true

class RetrieveArticlesJob < ApplicationJob
  queue_as :default

  def perform
    ConsumingApiService.new(20_000).persist_data
  end
end
