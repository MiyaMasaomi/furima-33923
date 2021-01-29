FactoryBot.define do
  factory :item do
    name                 { 'テスト' }
    price                { 500 }
    description          { 'テストサンプル' }
    category_id          { 2 }
    condition_type_id    { 2 }
    postage_id           { 2 }
    shipping_area_id     { 2 }
    days_to_ship_id      { 2 }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.jpg'), filename: 'sample.jpg')
    end
  end
end
