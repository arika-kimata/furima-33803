class Item < ApplicationRecord

  # アソシエーション
  belongs_to :user
  has_one_attached :image

  # バリデーション  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charges
  belongs_to :prefectures
  belongs_to :shipping_date

end
