require 'rails_helper'

RSpec.describe User , type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it "nicknameが空では登録できないこと" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it" メールアドレスは@を含んでいないと保存できない" do
      @user.email = "0"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordは半角数字が含まれていること" do
      @user.password = "あ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordは半角英字が含まれていること" do
      @user.password = "あ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it"ユーザー本名が必須であること" do
      @user.firstname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it"ユーザー名字が必須であること" do
      @user.lastname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end

    it"ユーザー本名（名前）のフリガナが必須であること" do
      @user.firstname_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
    end

    it"ユーザー本名（苗字）のフリガナが必須であるこ" do
      @user.lastname_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
    end

    it"ユーザー本名（名前）のフリガナは全角（カタカナ）で入力させること" do
      @user.firstname_kana = "0aAあ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana Full-width katakana characters")
    end

    it"ユーザー本名（苗字）のフリガナは全角（カタカナ）で入力させること" do
      @user.lastname_kana = "0aAあ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kana Full-width katakana characters")
    end

    it"生年月日が必須であること" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end