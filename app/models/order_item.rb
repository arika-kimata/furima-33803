class OrderItem
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postcode, :prefectures_id, :municipality, :address, :building, :phone_number

  with_options presence: true do
    validates :user_id, :item_id, :token, :postcode, :municipality, :address
    validates :prefectures_id, numericality: { greater_than_or_equal_to: 1, message: 'が未選択です。' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は、半角数字で入力して下さい。' }
    with_options format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は、半角数字で入力し、半角ハイフンを含めて下さい。' } do
      validates :postcode, length: { is: 8, message: 'は、ハイフンを含む８桁で入力して下さい。' }
    end
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefectures_id, municipality: municipality, address: address,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end