json.articles do
  json.array! @loading_service.records, partial: 'v1/articles/article', as: :article
end

json.meta do
  json.partial! 'shared/pagination', pagination: @loading_service.pagination
end