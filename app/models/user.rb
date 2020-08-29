class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # 空の場合はDBに保存しないというバリデーション＋αの制約
  with_options presence: true do
     validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]{6,128}+\z/i, message: "６文字以上の半角英数字"} 
     validates :nickname, format:
     validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "例）山田"}
     validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "例）隆太郎"}
     validates :lastname_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "例）ヤマダ"}
     validates :firstname_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "例）リクタロウ"}
     validates :birthday
  end

  # #アソシエーション
  has_many:items
  # has_many:profiles
  
end
