FactoryBot.define do
  factory :cart_item do
    quantity { 1 }
    protein { nil }
    cart { nil }
  end
end
