FactoryBot.define do
  factory :item do
    title       {Faker::Commerce.product_name}
    explanation {Faker::Lorem.sentence}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test2.png'), filename: 'test2.png')
    end
  end
end
