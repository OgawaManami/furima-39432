FactoryBot.define do
  factory :item do
    association :user

    item_name { Faker::Name.name }
    item_text { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 10) }
    item_condition_id { Faker::Number.between(from: 1, to: 6) }
    delivery_charge_id { Faker::Number.between(from: 1, to: 2) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    delivery_date_id { Faker::Number.between(from: 1, to: 3) }
    item_price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image.png'), filename: 'image.png')
    end
  end
end
