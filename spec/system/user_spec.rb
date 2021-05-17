require 'rails_helper'

RSpec.describe 'ユーザー登録、セッション機能のテスト', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @second_user = FactoryBot.create(:second_user)
  end

  describe 'ユーザー登録のテスト' do
    context 'ユーザーの新規登録した場合' do
      it '新規登録したユーザーのマイページが表示される' do
        visit new_user_registration_path
        fill_in 'user_name', with:'sample_user'
        fill_in 'user_email', with:'sample@example.com'
        fill_in 'user_password', with:'123456'
        fill_in 'user_password_confirmation', with:'123456'
        click_on 'アカウント登録'
        expect(page).to have_content '今日'
      end
    end

    context 'ユーザーがログインせずにカレンダー画面に飛んだ時' do
      it 'ログイン画面に遷移される' do
        visit trades_path
        expect(current_path).to eq new_user_session_path
        expect(current_path).not_to eq trades_path
        expect(page).to have_content 'ログイン'
      end
    end
  end
end