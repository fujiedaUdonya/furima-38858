require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品の保存' do

    context "出品商品の情報が保存できる場合" do
      it "item_title, introduction, category_id, condition_id, shipping_charge_id, prefecture_id, day_to_ship_id, price, image が存在すれば商品情報を保存できる" do
        expect(@item).to be_valid
      end
    end

    context "出品商品の情報が保存できない場合" do
      
      it "item_titleが空欄では保存できない" do
        @item.item_title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item title can't be blank")
      end
      it "introductionが空欄では保存できない" do
        @item.introduction = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it "category_idが「---」では保存できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが「---」では保存できない" do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "shipping_charge_idが「---」では保存できない" do
        @item.shipping_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it "prefecture_idが「---」では保存できない" do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "day_to_ship_idが「---」では保存できない" do
        @item.day_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship can't be blank")
      end
      it "priceがないと保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "画像がないと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end     
      it "ユーザーが紐付いていないと保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "価格に半角数字以外が含まれている場合は出品できない" do
        @item.price = "あ亜a"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "価格が300円未満では出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")  
      end
      it "価格が9,999,999円を超えると出品できない" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999" )  
      end  
    end
  end
end
