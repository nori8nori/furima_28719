class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  #空の場合はDBに保存しないというバリデーション＋αの制約
  with_options presence: true do
    # validates :email, format: { with: /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/, message: "PC・携帯どちらでも可"}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6}\z/, message: "６文字以上の半角英数字"}    
    validates :nickname, format: { with: /\A[ぁ-んァ-ン一-龥]\A[a-zA-Z0-9]+\z/, message: "例）Furima太郎"}
    validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "例）山田"}
    validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "例）隆太郎"}
    validates :lastname_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "例）ヤマダ"}
    validates :firstname_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "例）リクタロウ"}
    validates :birthday 
  end

  #アソシエーション
  has_many:items
  has_many:profiles
  
end
