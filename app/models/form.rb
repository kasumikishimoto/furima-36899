class Form
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_nu, :purchase_information_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_nu, format: { with: /\A\d{10,11}\z/ }
    validates :purchase_information_id
  end
  

  def save
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, phone_nu: phone_nu, purchase_information_id: purchase_information.id)
    purchase_information = PurchaseInformation.create(item_id: item_id, user_id: user_id)
  end

end