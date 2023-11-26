FactoryBot.define do
    factory :buying do
        token {"tok_abcdefghijk00000000000000000"}
        post_code {'123-4567'}
        region_id { Faker::Number.between(from: 2, to: 48) } 
        manicipality {'架空市'}
        address {'ホゲホゲ町1-2-3'}
        add_address {'無くても大丈夫ビル'}
        tell_address {'0120123123'}
    end
end
