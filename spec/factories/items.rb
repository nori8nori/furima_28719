FactoryBot.define do
  factory :item do

    name               {"ドラえもん"}
    explanation        {"2112年9月3日生まれ"}
    category_id        {1}
    status_id          {1}
    delivery_charge_id {1}
    delivery_area_id   {1}
    delivery_day_id    {1}
    price              {"1000"}

    association :user
  end
end