FactoryBot.define do
  factory :order_address do
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    post_code { '123-4567' }
    region_id {'2'}
    municipalities { '千代田区' }
    address_num { '丸の内1丁目' }
    tel_num { '1234567890' }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end