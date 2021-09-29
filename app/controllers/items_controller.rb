class ItemsController < ApplicationController

  def index
    
  end
  

  private
  def item_params
    params.require(:item).permit(:title, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
