class PurchaseController < ApplicationController
  before_action :set_item
  before_action :move_to_index, only: :index
  # before_action :pay_item, only: :create 

  def index
    @purchase_address =  PurchasesAddress.new
  end

  def create
    @purchase_address = PurchasesAddress.new(purchases_address_params)
    if @purchase_address.valid?
      # pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @items.price, # 商品の値段
        card: purchases_address_params[:token],   # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  
      @purchase_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchases_address_params
    params.require(:purchases_address).permit(:post_code, :prefecture_id, :city, :house_number, :other, :phone_number ).merge( user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  # def pay_item     処理の流れを把握するためメゾットに切り分けせずにcreate内に記述しています
    
  # end  
  
  def move_to_index
    @items = Item.find(params[:item_id])
    if (@items.user_id == current_user.id) || @items.purchase != nil 
      redirect_to root_path
    end
  end

  def set_item
    @items = Item.find(params[:item_id])
  end


end
