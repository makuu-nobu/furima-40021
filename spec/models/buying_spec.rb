require 'rails_helper'

RSpec.describe Buying, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buying = FactoryBot.build(:buying, user_id: @user.id, item_id: @item.id)
  end
  context 'すべての情報が揃っていれば購入ができる' do
    it 'すべての値が正しく入力されていれば購入できる' do
      expect(@buying).to be_valid
    end
    it 'add_addressが空欄でも購入できる' do
      @buying.add_address = ''
      expect(@buying).to be_valid
    end
  end
end
