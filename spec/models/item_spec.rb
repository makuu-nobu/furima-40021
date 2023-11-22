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

  end
end
