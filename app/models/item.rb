class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions

    # テーブルとのアソシエーション
    belongs_to :user
    has_one    :order

      # active_storageとのアソシエーション
      has_many_attached :images

    # アクティブハッシュとのアソシエーション
    belongs_to :category
    belongs_to :prefecture
    belongs_to :item_condition
    belongs_to :delivery_charge
    belongs_to :delivery_date

    validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
    validates :item_name, presence: true
    validates :item_price, presence: true
    validates :item_text, presence: true
    validates :category_id, presence: true
    validates :item_condition_id, presence: true
    validates :delivery_charge_id, presence: true
    validates :prefecture_id, presence: true
    validates :delivery_date_id, presence: true
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :item_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  
  #ジャンルの選択が「---」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank" }
    validates :item_condition_id, numericality: { other_than: 0 , message: "can't be blank" }
    validates :delivery_charge_id, numericality: { other_than: 0 , message: "can't be blank" }
    validates :delivery_date_id, numericality: { other_than: 0 , message: "can't be blank" }
  end
