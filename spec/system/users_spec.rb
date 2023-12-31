require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録できる時' do
    it '正しい情報を入力すればユーザ新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      fill_in 'last-name', with: @user.first_name
      fill_in 'first-name', with: @user.last_name
      fill_in 'last-name-kana', with: @user.first_name_kana
      fill_in 'first-name-kana', with: @user.last_name_kana
      select '1930', from: 'user[birth_day(1i)]'
      select '10', from: 'user[birth_day(2i)]'
      select '10', from: 'user[birth_day(3i)]'
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
        sleep 1
      }.to change{ User.count }.by(1)
      # トップページへ遷移することを確認する
      expect(page).to have_current_path(root_path)
      # ページにログアウトボタンとユーザー名が現れていること
      expect(page).to have_content('ログアウト')
      expect(page).to have_content("#{@user.nickname}")
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'nickname', with: ''
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      fill_in 'password-confirmation', with: ''
      fill_in 'last-name', with: ''
      fill_in 'first-name', with: ''
      fill_in 'last-name-kana', with: ''
      fill_in 'first-name-kana', with: ''
      select '--', from: 'user[birth_day(1i)]'
      select '--', from: 'user[birth_day(2i)]'
      select '--', from: 'user[birth_day(3i)]'
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
        sleep 1
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(page).to have_current_path(new_user_registration_path)
    end
  end
end

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインできる時' do
    it '保存されているユーザーの情報と合致すればログインできる' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ移動する
      visit new_user_session_path
      #正しいユーザー情報を入力する
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      #ログインボタンを押す
      find('input[name="commit"]').click
      #トップページに遷移することを確認する
      expect(page).to have_current_path(root_path)
    end
  end
  context 'ログインできない時' do
    it '保存されているユーザーと情報が合致しなければログインできない' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ移動する
      visit new_user_session_path
      #ユーザー情報を入力する
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      #ログインページに戻される
      expect(page).to have_current_path(new_user_session_path)
    end
  end
end