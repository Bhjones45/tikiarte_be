FactoryBot.define do
  factory :artist do
    username { Faker::Internet.unique.email(domain: 'gmail') }
    password { Faker::Number.unique.number(digits: 5).to_s }
    director

    trait :with_images do
      transient do
        image_count { 3 }
      end

      after(:create) do |artist, evaluator|
        create_list(:image, evaluator.image_count, artist: artist)
      end
    end
  end
end
