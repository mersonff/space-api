# frozen_string_literal: true

FactoryBot.define do
  factory :launch do
    provider { Faker::Name.name }
    article { nil }
  end
end
