FactoryBot.define do
  factory :article do
    title { Faker::Book.title }
    url { Faker::Internet.url }
    imageUrl { Faker::Internet.url(host: 'example.com', path: '/foobar.jpeg') }
    newsSite { Faker::Internet.url }
    summary { Faker::Book.title }
    publishedAt { Faker::Book.publisher }
    featured { false }
  end
end
