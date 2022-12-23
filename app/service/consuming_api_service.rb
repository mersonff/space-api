class ConsumingApiService
  include HTTParty

  attr_accessor :limit

  def initialize(limit = nil)
    @limit = limit || 17_000
  end

  def data(limit)
    HTTParty.get("https://api.spaceflightnewsapi.net/v3/articles?_limit=#{limit}")
  end

  def persist_data
    data(@limit).each_slice(100) do |batch|
      batch.each do |article|
        find_or_create_records(article)
      end
    end
  end

  def find_or_create_records(article)
    Article.find_or_create_by!(
      title: article['title'],
      featured: article['featured'],
      url: article['url'],
      newsSite: article['newsSite'],
      imageUrl: article['imageUrl'],
      summary: article['summary'],
      publishedAt: article['publishedAt']
    ).tap do |created_article|
      create_events(created_article, article['events'])
      create_launches(created_article, article['launches'])
    end
  end

  def create_events(article, events)
    events.each do |event|
      article.events.find_or_create_by!(
        provider: event['provider']
      )
    end
  end

  def create_launches(article, launches)
    launches.each do |launch|
      article.launches.find_or_create_by!(
        provider: launch['provider']
      )
    end
  end
end