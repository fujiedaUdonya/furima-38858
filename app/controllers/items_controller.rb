class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :edit  ]
  before_action :set_item, only: [:show, :edit, :update ]
  before_action :move_to_index, only: [:edit]

  def index
    @items =  Item.all.order(id: :DESC)
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
  
  def edit 
    if @items.user_id != current_user.id
      redirect_to root_path
    end
  end

  def show
  end  

  def update
    if @items.update(item_params)
      redirect_to item_path
    else
      render :edit
    end  
  end

  private

  def item_params
    params.require(:item).permit(:item_title,:introduction,:price,:day_to_ship_id,:shipping_charge_id,:condition_id,:category_id,:prefecture_id,:image).merge(user_id: current_user.id)
  end

  def set_item
    @items = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end