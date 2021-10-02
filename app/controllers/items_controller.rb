class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :create_instance, except: [:index, :new, :create, :show]


  def index
    @items = Item.order("created_at DESC")
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

  private
  def item_params
    params.require(:item).permit(:title, :description, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

    def create_instance
      @item = Item.find(params[:id])
    end
end
