class Buy < ApplicationRecord
  has_one :oder
  belongs_to :item
  belongs_to :user
end
