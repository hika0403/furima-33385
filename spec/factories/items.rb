FactoryBot.define do
  factory :item do
    name            { Faker::Name.name }
    text            { Faker::Lorem.sentence }
    category_id     { 2 }
    situation_id    { 2 }
    shopping_day_id { 2 }
    area_id         { 2 }
    charge_id       { 2 }
    price           { 500 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
