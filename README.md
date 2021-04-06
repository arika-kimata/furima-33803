# テーブル設計

## usersテーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| nickname        | string | null: false               |
| last_name       | string | null: false               |
| family_name     | string | null: false               |
| j_last_name     | string | null: false               |
| j_family_name   | string | null: false               |
| birth_year      | string | null: false               |
| birth_month     | string | null: false               |
| birth_day       | string | null: false               |

### Association
 - has_one :address
 - has_many :items
 - has_many :buys

##  itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item             | string     | null: false                    |
| explanation      | string     | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| shipping_charges | string     | null: false                    |
| shipping_area    | string     | null: false                    |
| shipping_date    | string     | null: false                    |
| price            | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - has_one :buy

## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
 - belongs_to :item
 - belongs_to :user
 
 ## address テーブル

| Column           | Type       | Options                            |
| ---------------- | ---------- | ---------------------------------- |
| postcode         | string     | null: false                        |
| prefectures      | string     | null: false                        |
| municipality     | string     | null: false                        |
| address          | string     | null: false                        |
| building         | string     | null: false                        |
| phone_number     | string     | null: false                        |
| user             | references | null: false, foreign_key: true     |

### Association
 - belongs_to :user

