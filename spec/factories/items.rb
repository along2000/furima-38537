FactoryBot.define do
  factory :item do
    name { '15年前の切手' }
    text                  { '15年前の切手です。実家の押し入れから出てきましたが、価値がわからないため出品します。' }
    price                 { '10000' }
    delivery_date_id      { '2' }
    delivery_charge_id    { '2' }
    delivery_source_id    { '2' }
    category_id           { '2' }
    status_id             { '2' }
    association :user
  end
end
