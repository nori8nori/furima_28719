class Oder < ApplicationRecord

  # belongs_to_active_hashを使用するための記述
  extend ActiveHash::Associations::ActiveRecordExtensions

  #アソシエーション
  belongs_to :buy
  belongs_to_active_hash :delivery_area

  #バリデーション設定
  with_options presence: true do
    validates :postalcode
    validates :edelivery_area_id
    validates :municipalities
    validates :address
    # validates :building
    validates :phone
    validates :buy_id
  end

  # 選択が「--」の時は保存できないようにする
  validates :delivery_area_id, numericality: { other_than: 0, message: 'Select' }

end
