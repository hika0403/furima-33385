require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  describe '購入情報の保存' do
    before do
      @order_buyer = FactoryBot.build(:order_buyer)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_buyer).to be_valid
    end
    it '郵便番号が空だと保存できないこと' do
      @order_buyer.postal_code = ""
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include "Postal code can't be blank"
    end
    it '郵便番号がハイフンなしでは保存できないこと' do
      @order_buyer.postal_code = 1231234
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include "Postal code is invalid"
    end
    it '都道府県が空だと保存できないこと' do
      @order_buyer.prefecture = ""
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include "Prefecture can't be blank"
    end
    it '都道府県の値が０では保存できないこと' do
      @order_buyer.prefecture = 0
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include "Prefecture must be other than 0"
    end
    it '市区町村が空だと保存できないこと' do
      @order_buyer.town = ""
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include "Town can't be blank"
    end
    it '番地が空だと保存できないこと' do
      @order_buyer.address = ""
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include "Address can't be blank"
    end
    it '建物名は空でも保存できること' do
      @order_buyer.building = ""
      expect(@order_buyer).to be_valid
    end
    it '電話番号が空だと保存できないこと' do
      @order_buyer.phone_number = ""
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include "Phone number can't be blank"
    end
    it '電話番号がハイフンありだと保存できないこと' do
      @order_buyer.phone_number = "090-1234-5678"
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include "Phone number is invalid"
    end
    it '電話番号が11桁より多いと保存できない' do
      @order_buyer.phone_number = "090123456789"
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include "Phone number is invalid"
    end
    it '電話番号が11桁より少ないと保存できない' do
      @order_buyer.phone_number = "090123456"
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include "Phone number is invalid"
    end
    it 'tokenが空では保存できないこと' do
      @order_buyer.token = ""
      @order_buyer.valid?
      expect(@order_buyer.errors.full_messages).to include "Token can't be blank"
    end
  end
end
