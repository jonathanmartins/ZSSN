FactoryGirl.define do
  factory :survivor do
    name { Faker::StarWars.character }
    age { Faker::Number.between(1, 150) }
    gender [:male, :female].sample
    infected false
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    inventory {{water: 2, food: 2}}
  end
end
