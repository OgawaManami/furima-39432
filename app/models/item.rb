class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions

    # テーブルとのアソシエーション
    belongs_to :user
    belongs_to :category
    # has_one    :order
    # has_many   :comments
    # has_one    :shipping

      # active_storageとのアソシエーション
    has_one_attached :image

    # アクティブハッシュとのアソシエーション
    belongs_to :category
    belongs_to :prefecture
    belongs_to :item_condition
    belongs_to :delivery_charge
    belongs_to :delivery_date

    validates :image, presence: true
    validates :item_name, presence: true
    validates :item_price, presence: true
    validates :item_text, presence: true
    validates :category_id, presence: true
    validates :item_condition_id, presence: true
    validates :delivery_charge_id, presence: true
    validates :prefecture_id, presence: true
    validates :delivery_date_id, presence: true
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  
  #ジャンルの選択が「---」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank" }
    validates :item_condition_id, numericality: { other_than: 0 , message: "can't be blank" }
    validates :delivery_charge_id, numericality: { other_than: 0 , message: "can't be blank" }
    validates :delivery_date_id, numericality: { other_than: 0 , message: "can't be blank" }
  end
