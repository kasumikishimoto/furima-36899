class ShippingAddressesController < ApplicationController

  def index
    @form = Form.new
    @item = Item.find(params[:item_id])
  end


  def create
    @item = Item.find(params[:item_id])
    @form = Form.new(shipping_params)
    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def shipping_params
    params.require(:form).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_nu).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def  pay_item
    Payjp.api_key = ENV["FURIMA_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: shipping_params[:token],
      currency: 'jpy'
    )
  end
end