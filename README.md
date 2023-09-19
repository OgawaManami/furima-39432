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
| birthday           | integer | null: false               |


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_image         | text       | null: false                    |
| item_price         | integer    | null: false                    |
| item_text          | text       | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| category_id        | integer    | null: false, foreign_key: true |
| item_condition_id  | references | null: false, foreign_key: true |
| bdelivery_charge   | integer    | null: false                    |
| shipping_source_id | integer    | null: false, foreign_key: true |
| delivery_date      | integer    | null: false                    |


## item_images テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_id   | references | null: false, foreign_key: true |
| image_url | string     | null: false                    |


## categorys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| category_id   | references | null: false, foreign_key: true |
| category_name | references | null: false, foreign_key: true |


## item_condition テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_id        | references | null: false, foreign_key: true |
| item_condition | references | null: false, foreign_key: true |


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |
| comment   | text       | null: false                    |


## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user_id             | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |


## adresses テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user_id             | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |
| shipping_source_id  | integer    | null: false, foreign_key: true |
| shipping_address_id | integer    | null: false, foreign_key: true |

