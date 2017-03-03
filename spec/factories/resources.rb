FactoryGirl.define do
  factory :resource do
    name { [:water, :food, :medication, :ammunition].sample }
    quantity { Faker::Number.between(1, 10) }
    survivor_id nil
  end
end
