class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    # @items =  Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # @items = Item.find(params[:id])
  end  
  
  private

  def item_params
    params.require(:item).permit(:item_title,:introduction,:price,:day_to_ship_id,:shipping_charge_id,:condition_id,:category_id,:prefecture_id,:image).merge(user_id: current_user.id)
  end

end  