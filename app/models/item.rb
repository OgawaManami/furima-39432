class Item < ApplicationRecord

    # テーブルとのアソシエーション
    belongs_to :user
    belongs_to :category
    has_one    :order
    has_many   :comments
    has_one    :shipping
    has_one    :order

      # active_storageとのアソシエーション
    has_one_attached :image

    # アクティブハッシュとのアソシエーション
    belongs_to :category
    belongs_to :prefecture
    belongs_to :item_condition
    belongs_to :delivery_charge
    belongs_to :delivery_date
  
  #ジャンルの選択が「---」の時は保存できないようにする
    validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}

  end
