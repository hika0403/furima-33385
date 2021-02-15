require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do

    context "新規登録できるとき" do
      it "全ての入力があれば登録できること" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できること" do
        @user.password = "abc123"
        @user.password_confirmation = "abc123"
        @user.save
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合であれば登録できること" do
        @user.password = "abc123"
        @user.password_confirmation = "abc123"
        @user.save
        expect(@user).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "nicknameがない場合は登録できないこと" do
        @user.nickname = "" 
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailがない場合は登録できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailは登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに＠がない場合は登録できないこと" do
        @user.email = "aaagmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordがない場合は登録できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下の場合は登録できないこと" do
        @user.password = "aa111"
        @user.password_confirmation = "aa111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字混合でない場合は登録できないこと" do
        @user.password = "abcabc"
        @user.password_confirmation = "abcabc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードには英字と数字の両方を含めて設定してください")
      end
      it "passwordが確認用を含めて二回入力していない場合は登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationの値が一致していない場合は登録できないこと" do
        @user.password = "abc123"
        @user.password_confirmation = "aaa123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it  "last_name_kanjiがない場合は登録できないこと" do
        @user.last_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank", "Last name kanji 全角文字を使用してください")
      end
      it  "first_name_kanjiがない場合は登録できないこと" do
        @user.first_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank", "First name kanji 全角文字を使用してください")
      end
      it  "last_name_kanjiが全角でない場合は登録できないこと" do
        @user.last_name_kanji = "ｺﾏﾂ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji 全角文字を使用してください")
      end
      it  "first_name_kanjiが全角でない場合は登録できないこと" do
        @user.first_name_kanji = "ﾋｶﾙ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji 全角文字を使用してください")
      end
      it  "last_name_katakanaがない場合は登録できないこと" do
        @user.last_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana 全角（カタカナ）を使用してください")
      end
      it  "first_name_katakanaがない場合は登録できないこと" do
        @user.first_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana 全角（カタカナ）を使用してください")
      end
      it  "last_name_katakanaが全角でない場合は登録できないこと" do
        @user.last_name_katakana = "ｺﾏﾂ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana 全角（カタカナ）を使用してください")
      end
      it  "first_name_katakanaが全角でない場合は登録できないこと" do
        @user.first_name_katakana = "ｺﾏﾂ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana 全角（カタカナ）を使用してください")
      end
      it "birth_dayがない場合は登録できないこと" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end

  end
end