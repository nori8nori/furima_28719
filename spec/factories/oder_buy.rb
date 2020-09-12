FactoryBot.define do
  
  factory :oder_buy do
    token             { 'sampletokensampletoken' }
    postalcode        {'123-4567'}
    delivery_area_id  { 1 }
    municipalities    {'東京都練馬区月見台すすきヶ原'}
    address           {'3−10−5'}
    building          {'骨川スネ夫'}
    phone             {'09012345678'}
    user_id           { 1 }
    item_id           { 1 }
    # association :user
    # association :item
  end
end