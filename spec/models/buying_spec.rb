require 'rails_helper'

RSpec.describe Buying, type: :model do
  describe '商品購入記録の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buying = FactoryBot.build(:buying, user_id: @user.id, item_id: @item.id)
      sleep 1
    end
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@buying).to be_valid
      end
      it 'add_addressが空欄でも購入できる' do
        @buying.add_address = ''
        expect(@buying).to be_valid
      end
    end
    context '購入できない場合' do
      it '郵便番号が空欄では購入できない' do
        @buying.post_code = ''
        @buying.valid?
        expect(@buying.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が「３桁ハイフン４桁」の形式でないと購入できない' do
        @buying.post_code = '1234-123'
        @buying.valid?
        expect(@buying.errors.full_messages).to include('Post code は無効な形式です')
      end
      it '郵便番号が全角英数字の形式では購入できない' do
        @buying.post_code = '１２３ーあいうえ'
        @buying.valid?
        expect(@buying.errors.full_messages).to include('Post code は無効な形式です')
      end
      it 'region_idが1では購入できない' do
        @buying.region_id = 1
        @buying.valid?
        expect(@buying.errors.full_messages).to include("Region が未選択です")
      end
      it 'manicipalityが空欄では購入できない' do
        @buying.manicipality = ''
        @buying.valid?
        expect(@buying.errors.full_messages).to include("Manicipality can't be blank")
      end
      it 'addressが空欄では購入できない' do
        @buying.address = ''
        @buying.valid?
        expect(@buying.errors.full_messages).to include("Address can't be blank")
      end
      it 'tell_addressが空欄では購入できない' do
        @buying.tell_address = ''
        @buying.valid?
        expect(@buying.errors.full_messages).to include("Tell address can't be blank")
      end
      it 'tell_addressが9桁以下だと購入できない' do
        @buying.tell_address = '012345678'
        @buying.valid?
        expect(@buying.errors.full_messages).to include("Tell address は無効な形式です")
      end
      it 'tell_addressが12桁以上だと購入できない' do
        @buying.tell_address = '012345678910'
        @buying.valid?
        expect(@buying.errors.full_messages).to include("Tell address は無効な形式です")
      end
      it 'tell_addressが全角数字だと購入できない' do
        @buying.tell_address = '０１２０１２３１２３'
        @buying.valid?
        expect(@buying.errors.full_messages).to include("Tell address は無効な形式です")
      end
      it 'tokenがないと購入できない' do
        @buying.token = nil
        @buying.valid?
        expect(@buying.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが紐づいていないと購入できない' do
        @buying.user_id = ''
        @buying.valid?
        expect(@buying.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていないと購入できない' do
        @buying.item_id = ''
        @buying.valid?
        expect(@buying.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
