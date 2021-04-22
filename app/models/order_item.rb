class ItemOrder
  include ActiveModel::Model
  attr_accessor :postcode, :prefectures_id, :municipality, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postcode, :municipality, :address, :building
    validates :prefecture_id, numericality: { greater_than_or_equal_to: 1, message: 'が未選択です。' }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
      validates :postcode, length: { is: 8 } 
    end
  end

    def save
      Address.create(postcode: postcode, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number)
      Order.create(user_id: user_id, item_id: item_id)
    end
end