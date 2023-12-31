class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :prefecture_id, :city, :street, :building, :tel, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip_code , format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0}
    validates :city
    validates :street
    validates :tel, format: { with: /\A\d{10,11}\z/}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, street: street, building: building, tel: tel, order_id: order.id)
  end
end
