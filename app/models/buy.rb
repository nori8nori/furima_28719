class Buy < ApplicationRecord
  has_one :oder
  belongs_to :item
  belongs_to :user

  # バリデーション設定
  # with_options presence: true do

  #   validates :user_id
  #   validates :item_id

  # end
end
