class DeliveryDay < ActiveHash::Base
  
  self.data = [
    { id: 0, delivery_day:'--' },
    { id: 1, delivery_day:'1〜2日で発送'},
    { id: 2, delivery_day:'２〜３日で発送'},
    { id: 3, delivery_day:'4〜7日で発送'},
  ]
end