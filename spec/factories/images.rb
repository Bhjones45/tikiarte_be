FactoryBot.define do
  factory :image do
    status { 'private' }
    tags { Faker::Movies::StarWars.droid }
    description { Faker::Movies::StarWars.quote }
    title { Faker::Movies::StarWars.planet }
    artist
  end
end
