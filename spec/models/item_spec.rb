require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
    @user = FactoryBot.create(:user)
    @item.user_id = @user.id
  end

  describe '商品登録' do
    it '画像登録成功' do
      expect(@item).to be_valid
    end

    it '画像は1枚必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end

    it '商品の状態についての情報が必須であること' do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Status Select')
    end

    it '配送料の負担についての情報が必須であること' do
      @item.delivery_charge_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery charge Select')
    end

    it '発送元の地域についての情報が必須であること' do
      @item.delivery_area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery area Select')
    end

    it '発送までの日数についての情報が必須であること' do
      @item.delivery_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery day Select')
    end

    it '価格が300円以下ではいけない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it '価格が空欄ではいけない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が9,999,999以上ではいけない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
  end
end
