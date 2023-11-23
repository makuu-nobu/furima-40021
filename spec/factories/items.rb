FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    content { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }  
    situation_id { Faker::Number.between(from: 2, to: 7) }
    charge_id { Faker::Number.between(from: 2, to: 3) } 
    region_id { Faker::Number.between(from: 2, to: 48) } 
    how_long_id { Faker::Number.between(from: 2, to: 4) } 
    price { Faker::Number.between(from: 300, to: 9999999) }
    user { FactoryBot.create(:user) } 

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
