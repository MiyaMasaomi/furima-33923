class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :category_id
    validates :condition_type_id
    validates :postage_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end
end