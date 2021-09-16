FactoryBot.define do
  factory :director do
    email { Faker::Internet.unique.email(domain: 'gmail') }
    token { Faker::Number.unique.number(digits: 5) }
    google_id { Faker::Number.unique.number(digits: 5) }
  end
end
