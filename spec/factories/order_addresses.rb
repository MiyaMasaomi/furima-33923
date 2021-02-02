FactoryBot.define do
  factory :order_address do
    user_id                 { 1 }
    item_id                 { 1 }
    postal_code             { '555-5555' }
    shipping_area_id        { 2 }
    municipalities          { 'テスト市' }
    purchaser_address       { 'テスト1-1-1' }
    building_name           { 'テストビル111' }
    phone_number            { '01234567890' }
    token                   { 'sk_test_0000bbbbbbbbbb0000000000' }
  end
end
