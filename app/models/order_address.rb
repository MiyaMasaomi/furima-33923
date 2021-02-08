class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :municipalities, :purchaser_address, :building_name,
                :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'にはハイフン（ー）を含めてください' }
    validates :shipping_area_id, numericality: { other_than: 1, message: "を選んでください" }
    validates :municipalities
    validates :purchaser_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は１１桁までの数値を入力してください' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipalities: municipalities,
                   purchaser_address: purchaser_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
