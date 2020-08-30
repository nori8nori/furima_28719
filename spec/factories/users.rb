FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number:2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length:6)}
    password_confirmation {password}
    lastname              {"佐藤"}
    firstname             {"太郎"}
    lastname_kana         {"サトウ"}
    firstname_kana        {"タロウ"}
    birthday              {"1988-05-26"}
  end
end