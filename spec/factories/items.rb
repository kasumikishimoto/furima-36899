FactoryBot.define do
  factory :item do
    title             { '四次元ポケット' }
    category_id       { 2 }
    description       { '四次元ポケットです。' }
    shipping_fee_id   { 2 }
    status_id         { 2 }
    prefecture_id     { 2 }
    day_to_ship_id    { 2 }
    price             { 10_000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
