FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password { 'password123' } # 仮のパスワード
      password_confirmation { 'password123' }
      nickname { Faker::Name.unique.first_name }
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      first_name_kana { Faker::Japanese::Kana.first_name }
      last_name_kana { Faker::Japanese::Kana.last_name }
      birth_day { Faker::Date.birthday }
    end
  end