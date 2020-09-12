require 'rails_helper'

RSpec.describe OderBuy, type: :model do
  describe '商品購入' do
    before do
      @oder_buy = FactoryBot.build(:oder_buy)
    end

    it '商品購入成功' do
      expect(@oder_buy).to be_valid
    end

    it 'クレジット情報が必要です' do
      @oder_buy.token = ''
      @oder_buy.valid?
      expect(@oder_buy.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が必要です' do
      @oder_buy.postalcode = ''
      @oder_buy.valid?
      expect(@oder_buy.errors.full_messages).to include("Postalcode can't be blank")
    end

    it '都道府県の入力が必要です' do
      @oder_buy.delivery_area_id = 0
      @oder_buy.valid?
      expect(@oder_buy.errors.full_messages).to include("Delivery area can't be blank")
    end

    it '市区町村が未記入です' do
      @oder_buy.municipalities = ''
      @oder_buy.valid?
      expect(@oder_buy.errors.full_messages).to include("Municipalities can't be blank")
    end

    it '番地が未記入です' do
      @oder_buy.address = ''
      @oder_buy.valid?
      expect(@oder_buy.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が未記入です' do
      @oder_buy.phone = ''
      @oder_buy.valid?
      expect(@oder_buy.errors.full_messages).to include("Phone can't be blank")
    end

    it '郵便番号にはハイフンが必要であること' do
      @oder_buy.postalcode = '1234567'
      @oder_buy.valid?
      expect(@oder_buy.errors.full_messages).to include('Postalcode input correctly')
    end

    it '電話番号にはハイフンは不要で、11桁以内であるこ' do
      @oder_buy.phone = '03-123-4567'
      @oder_buy.valid?
      expect(@oder_buy.errors.full_messages).to include('Phone input correctly')
    end
  end
end
