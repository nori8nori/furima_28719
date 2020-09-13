class Oder < ApplicationRecord
  # belongs_to_active_hashを使用するための記述
  extend ActiveHash::Associations::ActiveRecordExtensions

  # アソシエーション
  belongs_to :buy
  belongs_to_active_hash :delivery_area

end
