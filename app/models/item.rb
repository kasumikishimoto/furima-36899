class Item < ApplicationRecord

  validates :title,           presence: true
  validates :category_id,     presence: true
  validates :description,     presence: true
  validates :status_id,       presence: true
  validates :shipping_fee_id, presence: true
  validates :prefecture_id,   presence: true
  validates :day_to_ship_id,  presence: true
  validates :price,           presence: true

  belongs_to :user
  has_one_attached :image
  #has_one :purchase_information

end
