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
      it "category_idが空欄では保存できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが空欄では保存できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "shipping_charge_idが空欄では保存できない" do
        @item.shipping_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it "prefecture_idが空欄では保存できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "day_to_ship_idが空欄では保存できない" do
        @item.day_to_ship_id = ""
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
    end
  end
end
