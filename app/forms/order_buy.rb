class OrderBuy

  include ActiveModel::Model

  attr_accessor :postalcode, :edelivery_area_id, :edelivery_area_id, :municipalities, :address, :delivery_area_id

  #バリデーション設定
  with_options presence: true do
    validates :postalcode
    validates :edelivery_area_id
    validates :municipalities
    validates :address
    # validates :building
    validates :phone
    validates :buy_id
    validates :user_id
    validates :item_id
  end

  # 選択が「--」の時は保存できないようにする
  validates :delivery_area_id, numericality: { other_than: 0, message: 'Select' }

end
