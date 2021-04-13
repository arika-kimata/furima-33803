class User < ApplicationRecord
  # アソシエーション
  has_many :items

  # バリデーション
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # パスワード
  with_options confirmation: { message: '確認用パスワードとパスワードは一致しないといけません。' },
               format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: 'は半角英数字混合での入力が必須です。' } do
    validates :password
    validates :password_confirmation, presence: true
  end

  # ニックネーム
  validates :nickname, presence: true

  # 苗字、氏名
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は、全角（漢字・ひらがな・カタカナ）での入力が必須です。' } do
    validates :last_name
    validates :family_name
  end

  # 苗字、氏名のかな入力
  with_options presence: true, format: { with: /\A[ァ-ヶーー]+\z/, message: 'は、全角（カタカナ）での入力が必須です。' } do
    validates :j_last_name
    validates :j_family_name
  end

  # 生年月日
  validates :birthday, presence: true

end