FactoryBot.define do
  factory :order_item do
    association :user
    association :item
    token          {'tok_abcdefghijk00000000000000000'}
    postcode       {'123-4567'}
    prefectures_id {2}
    municipality   {'青森市'}
    address        {'1-1-1'}
    building       {'建物ビル'}
    phone_number   {'09022223333'} 
  end
end