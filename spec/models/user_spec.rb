require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@gmail.com', password: '111aaa', password_confirmation: '111aaa',
                      first_name: '田中', last_name:'太郎', first_name_kana: 'タナカ', last_name_kana: 'タロウ',
                      birth_day: '2000-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'タナカ', email: '', password: '111aaa', password_confirmation: '111aaa',
                      first_name: '田中', last_name:'太郎', first_name_kana: 'タナカ', last_name_kana: 'タロウ',
                      birth_day: '2000-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'タナカ', email: '', password: '111aaa', password_confirmation: '111aaa',
                      first_name: '田中', last_name:'太郎', first_name_kana: 'タナカ', last_name_kana: 'タロウ',
                      birth_day: '2000-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
