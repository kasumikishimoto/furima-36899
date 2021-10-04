class ShippingAddressController < ApplicationController

  def private
    params.require(:shipping_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_nu, :purchase_information).merge(user_id: current_user.id)
  end

end
