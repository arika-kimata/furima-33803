class Item < ApplicationRecord

  # アソシエーション
  belongs_to :user
  has_one_attached :image
 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charges
  belongs_to :prefectures
  belongs_to :shipping_date

  # バリデーション 
  
  # 商品画像
  validates :image, presence: true

  # 商品名
  validates :product_name, presence: true

  # 商品説明
  validates :explanation, presence: true

  # カテゴリー

  validates :category_id, presence: true

  # 商品の状態
  validates :status_id , presence: true

  # 配送料の負担
  validates :shipping_charges_id, presence: true

  # 発送元の地域
  validates :prefectures_id, presence: true

  # 発送までの日数
  validates :shipping_date_id, presence: true

  # 販売価格
  with_options presence: true, numericality: { message: 'は、半角数字で入力して下さい。' }, format: { with: /\A[0-9]+\z/}, inclusion: { in: 300..9999999, message: "は、300円から9,999,999円の間で入力して下さい。" }  do
    validates :price
  end

end
