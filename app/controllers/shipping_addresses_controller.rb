class ShippingAddressesController < ApplicationController

  def index
    @form = Form.new
  end

  def new
    
  end


  def create
    binding.pry
    @form = Form.save
  end


  def private
    params.require(:shipping_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_nu, :purchase_information).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
