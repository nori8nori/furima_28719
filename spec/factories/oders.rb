FactoryBot.define do
  factory :oder do

    postalcode               { '123-4567' }
    delivery_area_id        { 1 }
    cmunicipalities       { '東京都練馬区月見台すすきヶ原' }
    address        { '3−10−5' }
    building{'骨川スネ夫'}
    phone { '09012345678' }

  end
end