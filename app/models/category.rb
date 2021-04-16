class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'メンズ' },
    { id: 4, name: 'コスメ' },
    { id: 5, name: 'キッズ/ベビー/マタニティ' },
    { id: 6, name: 'エンタメ/ホビー' },
    { id: 7, name: '楽器' },
    { id: 8, name: 'チケット' },
    { id: 9, name: 'インテリア/住まい/日用品' },
    { id: 10, name: 'スマホ/家電/カメラ' },
    { id: 11, name: 'ハンドメイド' },
    { id: 12, name: '食品/飲料/酒' },
    { id: 13, name: 'スポーツ/アウトドア' },
    { id: 14, name: '自転車/バイク' },
    { id: 15, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
  
  end