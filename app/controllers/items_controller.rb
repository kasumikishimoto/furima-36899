class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[index create show]
  before_action :move_to_index, except: %i[index show]
  before_action :create_instance, except: %i[index new create show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == item.user_id
    redirect_to root_path if item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id,
                                 :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def create_instance
    @item = Item.find(params[:id])
  end
end
