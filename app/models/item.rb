class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :day_to_ship
  belongs_to :user
  has_one    :purchase_information
  has_one_attached :image
  has_one :purchase_information

  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :day_to_ship_id
  end
end