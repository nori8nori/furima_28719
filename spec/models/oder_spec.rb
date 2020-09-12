require 'rails_helper'

RSpec.describe Oder, type: :model do
  before do
    @oder = FactoryBot.build(:oder)
  end

  describe '商品購入' do
    it '商品購入成功' do
      expect(@oder).to be_valid
    end


    it '郵便番号が必要です' do
      @oder.token = ''
      @item.valid?
      expect(@oder.errors.full_messages).to include("can't be blank")
    end

    it '郵便番号が必要です' do
      @oder.postalcode = ''
      @item.valid?
      expect(@oder.errors.full_messages).to include("Postalcode can't be blank")
    end
    
    it '都道府県の入力が必要です' do
      @oder.delivery_area_id = 0
      @item.valid?
      expect(@oder.errors.full_messages).to include(" can't be blank")
    end

    it '市区町村が未記入です' do
      @oder.municipalities = ''
      @item.valid?
      expect(@oder.errors.full_messages).to include(" can't be blank")
    end

    it '番地が未記入です' do
      @oder.adderss = ''
      @item.valid?
      expect(@oder.errors.full_messages).to include(" can't be blank")
    end

    it '建物名が未記入です' do
      @oder.building = ''
      @item.valid?
      expect(@oder.errors.full_messages).to include(" can't be blank")
    end

    it '電話番号が未記入です' do
      @oder.phone = ''
      @item.valid?
      expect(@oder.errors.full_messages).to include(" can't be blank")
    end

    it '郵便番号にはハイフンが必要であること' do
      @oder.postalcode = '1234567'
      @item.valid?
      expect(@oder.errors.full_messages).to include(" can't be blank")
    end

    it '電話番号にはハイフンは不要で、11桁以内であるこ' do
      @oder.postalcode = '03-123-4567'
      @item.valid?
      expect(@oder.errors.full_messages).to include(" can't be blank")
    end
  end
end
