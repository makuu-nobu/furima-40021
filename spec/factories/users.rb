FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password { 'password123' } # 仮のパスワード
      password_confirmation { 'password123' }
      nickname { Faker::Name.unique.first_name }
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      first_name_kana { Faker::Japanese::Name.first_name }
      last_name_kana { Faker::Japanese::Name.last_name }
      encrypted_password { Devise::Encryptor.digest(User, 'password123') } # 仮のパスワード
      birth_day { Faker::Date.birthday(min_age: 18, max_age: 65) }
    end
  end