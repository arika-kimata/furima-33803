class Item < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charges
  belongs_to :prefectures
  belongs_to :shipping_date

  # バリデーション

  # 商品画像、商品名、商品説明
  with_options presence: true do
    validates :image
    validates :product_name
    validates :explanation
  end

  # カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数
  with_options numericality: { greater_than_or_equal_to: 1, message: 'が未選択です。' } do
    validates :category_id
    validates :status_id
    validates :shipping_charges_id
    validates :prefectures_id
    validates :shipping_date_id
  end

  # 販売価格
  with_options presence: true, numericality: { message: 'は、半角数字で入力して下さい。' }, format: { with: /\A[0-9]+\z/ },
               inclusion: { in: 300..9_999_999, message: 'は、300円から9,999,999円の間で入力して下さい。' } do
    validates :price
  end
end
