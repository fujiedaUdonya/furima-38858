require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
      
   describe "ユーザー新規登録" do
     context "新規登録できる場合" do  
        it "nickname, email, password,first_name, first_name_kana, last_name, last_name_kana, birth_date が存在すると登録できる"  do
          expect(@user).to be_valid
        end
      end
      context "新規登録できない場合" do
        it "nicknameが空だと登録できない" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
  
        it "emailが空だと登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
  
        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
  
        it "emailは@を含まないと登録できない" do
          @user.email = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
  
        it "passwordが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
  
        it "passwordが5文字以下では登録できない" do
          @user.password = "t1t1t"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
  
        it "passwordが数字だけでは登録できない" do
          @user.password = "111111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
  
        it "passwordが英字だけでは登録できない" do
          @user.password = "tttttt"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
  
        it "last_nameが空では登録できない" do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
  
        it "last_nameが半角では登録できない" do
          @user.last_name = "ｱｲｳｴｵ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end
  
        it "first_nameが空では登録できない" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
  
        it "first_nameが半角では登録できない" do
          @user.first_name = "ｱｲｳｴｵ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
  
        it "last_name_kanaが空では登録できない" do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
  
        it "last_name_kanaが半角では登録できない" do
          @user.last_name_kana = "ｱｲｳｴｵ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid")
        end
  
        it "last_name_kanaが全角カタカナでなければ登録できない" do
          @user.last_name_kana = "あ亜a"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid")
        end
  
        it "first_name_kanaが空では登録できない" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
  
        it "first_name_kanaが半角では登録できない" do
          @user.first_name_kana = "ｱｲｳｴｵ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
  
        it "first_name_kanaが全角カタカナでなければ登録できない" do
          @user.first_name_kana = "あ亜a"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
  
        it "birth_dateが空では登録できない" do
          @user.birth_date = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end

        it "passwordが全角文字を含むパスワードでは登録できない" do
          @user.password = "ああ１１"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
    end  
  end  
end