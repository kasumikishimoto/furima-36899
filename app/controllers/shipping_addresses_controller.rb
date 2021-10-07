class ShippingAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :create_instance
  before_action :move_to_index
  before_action :same_user

  def index
    @form = Form.new
  end


  def create
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

  def create_instance
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id && @item.purchase_information != nil
      redirect_to root_path
    end
  end

  def same_user
    if current_user.id == @item.user_id
      redirect_to root_path
    end
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

#トップページに戻す　もし　（今ログインしているユーザー　＝＝　出品者）　　商品の購入の履歴があるかどうか