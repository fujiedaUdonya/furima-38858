require 'rails_helper'

RSpec.describe PurchasesAddress, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchases_address = FactoryBot.build(:purchases_address,item_id: item.id, user_id: user.id)
    end

    describe "購入者情報の保存" do

      context "購入者情報の保存ができる場合" do
      it  "post_code, prefecture_id, city, house-number, other, phone_number, token, user_id, item_id が存在すると保存できる" do
          expect(@purchases_address).to be_valid
      end

      it "otherが空でも存在できる" do 
        @purchases_address.other = ''
        expect(@purchases_address).to be_valid
      end

    end

    context '購入者情報の保存ができない場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchases_address.post_code = ''
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchases_address.post_code = '1234567'
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "prefecture_idが空だと保存できない" do
        @purchases_address.prefecture_id = ''
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idに「---」が選択されている場合は保存できない' do
        @purchases_address.prefecture_id = 0
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchases_address.city = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @purchases_address.house_number = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchases_address.phone_number = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは9桁以下だと登録できないこと' do
        @purchases_address.phone_number = "090123567"
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは11桁以上だと登録できないこと' do
        @purchases_address.phone_number = "009012345678"
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは半角数値のみ保存可能なこと' do
        @purchases_address.phone_number = "090-1234-5678"
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @purchases_address.token = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていなければ登録できない' do
        @purchases_address.user_id = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ登録できない'do
        @purchases_address.item_id = nil
        @purchases_address.valid?
        expect(@purchases_address.errors.full_messages).to include("Item can't be blank")
      end
  end
end

end
