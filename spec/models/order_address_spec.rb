require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 1
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'token,postal_code,shipping_area_id,municipalities,purchaser_address,building_name,phone_numberがあれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameがなくても登録できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("カード情報を入力してください")
      end
      it 'user_idが空では登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空では登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
      it 'postal_codeが空では登録できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeにハイフンが含まれていなければ登録できない' do
        @order_address.postal_code = '0000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号にはハイフン（ー）を含めてください')
      end
      it 'shipping_area_idが１では登録できない' do
        @order_address.shipping_area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を選んでください")
      end
      it 'municipalitiesが空では登録できない' do
        @order_address.municipalities = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市町村を入力してください")
      end
      it 'purchaser_addressが空では登録できない' do
        @order_address.purchaser_address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("住所を入力してください")
      end
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが11桁以内でなければ登録できない' do
        @order_address.phone_number = '111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は１１桁までの数値を入力してください')
      end
      it 'phone_numberが英数字混合では登録できない' do
        @order_address.phone_number = "a1a1a1a1a1a1"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は１１桁までの数値を入力してください")
      end
    end
  end
end
