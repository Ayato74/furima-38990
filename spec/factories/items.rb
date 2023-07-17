FactoryBot.define do
  factory :item do
    title              {Faker::Commerce.product_name}
    explanation        {Faker::Lorem.sentence}
    category_id        {'2'}
    condition_id       {'2'}
    delivery_charge_id {'2'}
    region_id          {'2'}
    num_of_day_id      {'2'}
    price              {'500'}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test2.png'), filename: 'test2.png')
      user = FactoryBot.create(:user)
      item.user = user
    end
  end
end
