class PurchaseRecord
  include ActiveModel::ActiveModel
  attr_accessor :token, :postal_code, :prefectures, :municipalities, :purchaser_address, :building_name, :phone_number

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities
    validates :purchaser_address
    validates :phone_number, format: { with: less_than_or_equal_to:11, message: "please enter within 11 digits"}
  end
    validates :building_name
  
  def save
    Address.create(postal_code: postal_code, prefectures: prefectures, municipalities: municipalities, prefecture_address: prefecture_address, building_name: building_name, phone_number: phone_number)
  end
end