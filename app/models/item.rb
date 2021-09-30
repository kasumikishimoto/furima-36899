class Item < ApplicationRecord

  validates :title,           presence: true
  validates :category_id,     numericality: { other_than: 1 }
  validates :description,     presence: true
  validates :status_id,       numericality: { other_than: 1 }
  validates :shipping_fee_id, numericality: { other_than: 1 }
  validates :prefecture_id,   numericality: { other_than: 1 }
  validates :day_to_ship_id,  numericality: { other_than: 1 }
  validates :price,           presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :day_to_ship

  belongs_to :user
  has_one_attached :image
  #has_one :purchase_information

end
