FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password { 'password123' } # 仮のパスワード
      password_confirmation { 'password123' }
      nickname { Faker::Name.unique.first_name }
      first_name { "田中" }
      last_name { "太郎" }
      first_name_kana { "タナカ" }
      last_name_kana { "タロウ" }
      birth_day { Faker::Date.birthday }
    end
  end