require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品機能' do
    context '商品出品ができる時' do
      it '必要情報がすべて記載されていれば商品が出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない時' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'contentが空では出品できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'situation_idが1では出品できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it 'charge_idが1では出品できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it 'region_idが1では出品できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it 'how_long_idが1では出品できない' do
        @item.how_long_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("How long can't be blank")
      end
      it 'priceが300未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は300から9,999,999の範囲で入力してください")
      end
      it 'priceが10000000以上だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は300から9,999,999の範囲で入力してください")
      end
      it 'priceが全角数字のときは出品できない' do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字で記入してください")
      end
      it 'priceが数字ではないときは出品できない' do
        @item.price = "あいう"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字で記入してください")
      end
    end
  end
end
