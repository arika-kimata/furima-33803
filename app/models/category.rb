class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: 'レディース' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'コスメ' },
    { id: 4, name: 'キッズ/ベビー/マタニティ' },
    { id: 5, name: 'エンタメ/ホビー' },
    { id: 6, name: '楽器' },
    { id: 7, name: 'チケット' },
    { id: 8, name: 'インテリア/住まい/日用品' },
    { id: 90, name: 'スマホ/家電/カメラ' },
    { id: 10, name: 'ハンドメイド' },
    { id: 11, name: '食品/飲料/酒' },
    { id: 12, name: 'スポーツ/アウトドア' },
    { id: 13, name: '自転車/バイク' },
    { id: 14, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
