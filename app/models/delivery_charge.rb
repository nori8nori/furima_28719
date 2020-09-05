class DeliveryCharge < ActiveHash::Base
  self.data = [
    { id: 0, delivery_charge: '--' },
    { id: 1, delivery_charge: '着払い（購入者負担）' },
    { id: 2, delivery_charge: '送料込み（出品者負担）' }
  ]
end
