# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association
- has_many :items
- has_many :comments
- has_many :orders


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| item_price          | integer    | null: false                    |
| item_text           | text       | null: false                    |
| user                | references | null: false, foreign_key: true |
| category_id         | integer    | null: false                    |
| item_condition_id   | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| delivery_date_id    | integer    | null: false                    |

### Association
- belongs_to :user
- belongs_to :category
- has_many :comments
- has_one :shipping
- has_one :order


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| comment   | text       | null: false                    |

### Association
- belongs_to :user
- belongs_to :items


## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## address テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| order               | references | null: false, foreign_key: true |
| zip_code            | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| street              | string     | null: false                    |
| building            | string     |                                |
| tel                 | string     | null: false                    |

### Association
- belongs_to:order