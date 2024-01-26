FactoryBot.define do
  factory :user do
    nickname { Faker::Name.unique.first_name }
    email { Faker::Internet.unique.email }
    first_name_kanji { Faker::Name.first_name }
    last_name_kanji { Faker::Name.last_name }
    first_name { "カタカナ" } # 適切なカタカナデータを使用
    last_name { "カタカナ" }  # 適切なカタカナデータを使用
    birth { Faker::Date.birthday }
    password { "password123" }
    password_confirmation { "password123" }
  end
end