class ShippingAddressesController < ApplicationController

  def index
    @form = Form.new
    @item = Item.find(params[:item_id])
  end


  def create
    @form = Form.new(shipping_params)
    if @form.valid?
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def shipping_params
    params.require(:form).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_nu, :purchase_information, :image).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
