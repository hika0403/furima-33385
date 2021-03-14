FactoryBot.define do
  factory :order_buyer do
    postal_code  { '123-1234' }
    prefecture   { 2 }
    town         { '横浜市南区' }
    address      { 123 }
    building     { '横浜ハイツ' }
    phone_number { '09012345678' }
    token        { 'sk_123_abc_456' }
    item_id      { 2 }
    user_id      { 4 }
  end
end
