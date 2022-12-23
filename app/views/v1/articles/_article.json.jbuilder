# frozen_string_literal: true

json.article do
  json.extract! article, :id, :featured, :title, :url, :imageUrl, :newsSite, :summary, :publishedAt

  json.events article.events do |event|
    json.extract! event, :id, :provider
  end

  json.launches article.launches do |launch|
    json.extract! launch, :id, :provider
  end
end
