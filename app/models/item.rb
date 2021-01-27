class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition_type
  belongs_to :postage
  belongs_to :shipping_area
  belongs_to :days_to_ship

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_type_id
      validates :postage_id
      validates :shipping_area_id
      validates :days_to_ship_id
    end
  end
end