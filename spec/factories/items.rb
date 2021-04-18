FactoryBot.define do
  factory :item do
    association :user
    product_name          { 'テスト商品' }
    explanation           { 'テスト商品です、よろしくお願いします。' }
    category_id           { 1 }
    status_id             { 1 }
    shipping_charges_id   { 1 }
    prefectures_id        { 1 }
    shipping_date_id      { 1 }
    price                 { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image2.png'), filename: 'test_image2.png')
    end
  end
end
