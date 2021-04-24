class OrderItem
  include ActiveModel::Model
  attr_accessor :token, :postcode, :prefectures_id, :municipality, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token, :postcode, :municipality, :address, :building
    validates :prefectures_id, numericality: { greater_than_or_equal_to: 0, message: 'が未選択です。' }
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'は、半角数字で入力して下さい。'}
    with_options format: { with: /\A\d{3}[-]\d{4}\z/ , message: 'は、半角数字で入力して下さい。'} do
      validates :postcode, length: { is: 8 , message: 'は、7桁で入力して下さい。'} 
    end
  end

    def save
      @item.order = Order.create(user_id: user_id, item_id: item_id)
      Address.create(postcode: postcode, prefectures_id: prefectures_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id)
    end
end