class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :municipalities, :purchaser_address, :building_name, :phone_number, :token
  
  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :purchaser_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "please enter within 11 digits" }
  end
  
  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipalities: municipalities, purchaser_address: purchaser_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end