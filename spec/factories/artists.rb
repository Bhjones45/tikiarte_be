FactoryBot.define do
  factory :artist do
    username { Faker::Internet.unique.email(domain: 'gmail') }
    password { Faker::Number.unique.number(digits: 5).to_s }
    director
  end
end
