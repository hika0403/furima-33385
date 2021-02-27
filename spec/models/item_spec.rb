require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '新規出品がうまくいくとき' do
      it '全ての情報が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが300以上、9,999,999以下であれば登録できる' do
        @item.price = 145_683
        @item.save
        expect(@item).to be_valid
      end
      it 'priceが半角数字であれば登録できる' do
        @item.price = 56_789
        @item.save
        expect(@item).to be_valid
      end
    end

    context '新規出品がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'textが空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end
      it 'categpry_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'situation_idが空では登録できない' do
        @item.situation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Situation can't be blank"
      end
      it 'shopping_day_idが空では登録できない' do
        @item.shopping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shopping day can't be blank"
      end
      it 'area_idが空では登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it 'charge_idが空では登録できない' do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'piceが300以上9,999,999以下出なければ登録できない' do
        @item.price = 250
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'userが紐付いていないと登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
