class ShippingCharges < ActiveHash::Base
  self.data = [
    { id: 0, name: '----' },
    { id: 1, name: '送料込み(あなたが負担)' },
    { id: 2, name: '着払い(購入者が負担)' }
  ]

  include ActiveHash::Associations
  has_many :items
end
