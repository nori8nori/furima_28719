FactoryBot.define do
  factory :oder do

    postalcode               { '123-4567' }
    delivery_area_id        { 1 }
    cmunicipalities       { '東京シティー練馬グロック' }
    address        { 'ススキガハラストリート3−10−5' }
    building{}
    phone { 1 }

  end
end
