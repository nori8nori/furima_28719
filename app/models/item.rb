class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image

  belongs_to :user
  has_one :buy

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_day

  # 未入力ではダメ/エラーメッセージ表示される
  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :delivery_area_id
    validates :delivery_day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
    validates :user_id
    validates :image
  end
  # 選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, numericality: { other_than: 0, message: 'Select' }
end
