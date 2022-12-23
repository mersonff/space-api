FactoryBot.define do
  factory :event do
    provider { Faker::Name.name }
    article { nil }
  end
end
