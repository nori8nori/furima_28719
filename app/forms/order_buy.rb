class OrderBuy

  include ActiveModel::Model

  attr_accessor :postalcode, :delivery_area_id, :municipalities, :address, :delivery_area_id, :phone,
                             :buy_id, :user_id, :item_id

  #バリデーション設定
  with_options presence: true do
    validates :postalcode format: { with: /\A\d{3}[-]\d{4}\z/, message: '' }
    validates :delivery_area_id
    validates :municipalities
    validates :address
    # validates :building
    validates :phone format: { with: /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/, message: '' }
    validates :buy_id
    validates :user_id
    validates :item_id
  end

  # 選択が「--」の時は保存できないようにする
  validates :delivery_area_id, numericality: { other_than: 0, message: 'Select' }

  def save
    # 配送先情報を保存
    Order.create(postalcode: postalcode, delivery_area_id: delivery_area_id, municipalities: municipalities, address: address, phone: phone :buy_id buy.id)
    # 寄付金の情報を保存
    Buy.create(user_id: user.id, item_id: item.id)
  end


end