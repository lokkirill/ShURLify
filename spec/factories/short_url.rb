# frozen_string_literal: true

FactoryBot.define do
  factory :short_url do
    target_url { Faker::Internet.url host: 'kek.io', path: '/w8t' }
  end
end
