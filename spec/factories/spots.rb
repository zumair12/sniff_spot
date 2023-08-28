# frozen_string_literal: true

FactoryBot.define do
  factory :spot do
    title { Faker::Lorem.sentence }
    price { 2.35 }
    description { Faker::Lorem.paragraph }
  end
end
