FactoryBot.define do
  factory :item do
    association :user
    product_name          { 'テスト商品' }
    explanation           { 'テスト商品です、よろしくお願いします。' }
    category_id           { 6 }
    status_id             { 4 }
    shipping_charges_id   { 3 }
    prefectures_id        { 5 }
    shipping_date_id      { 2 }
    price                 { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image2.png'), filename: 'test_image2.png')
    end
  end
end
