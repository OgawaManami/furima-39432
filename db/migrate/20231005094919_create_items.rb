class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :item_name,          null: false
      t.integer    :item_price,         null: false
      t.text       :item_text,          null: false
      t.references :user,               null: false, foreign_key: true
      t.integer    :category_id,        null: false
      t.integer    :item_condition_id,  null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :prefecture_id,      null: false
      t.integer    :delivery_date_id,   null: false

      t.timestamps
    end
  end
end
