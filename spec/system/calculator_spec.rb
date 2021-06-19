require 'rails_helper'

RSpec.describe '電卓機能のテスト', type: :system do
  before do
    FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'user_email', with:'user1@test.com'
    fill_in 'user_password', with:'123456'
    click_on 'ログイン'
    find(".js-menu-toggle").click
    find(".calc").click
  end

  describe '電卓機能のテスト' do
    context '加算した場合' do
      it '正しい答えが表示される', js: true do
        click_on "1"
        click_on "0"
        click_on "0"
        click_on "+"
        click_on "1"
        click_on "0"
        click_on "0"
        click_on "="
        expect(page).to have_content "200"
      end
    end

    context '減算した場合' do
      it '正しい答えが表示される', js: true do
        click_on "2"
        click_on "0"
        click_on "0"
        click_on "-"
        click_on "2"
        click_on "0"
        click_on "0"
        click_on "="
        expect(page).to have_content "0"
      end
    end

    context '乗算した場合' do
      it '正しい答えが表示される', js: true do
        click_on "3"
        click_on "0"
        page.all(".btn-calc")[5].click        
        click_on "4"
        click_on "="
        expect(page).to have_content "120"
      end
    end

    context '除算した場合' do
      it '正しい答えが表示される', js: true do
        click_on "5"
        click_on "0"
        click_on "0"
        click_on "÷"
        click_on "5"
        click_on "="
        expect(page).to have_content "100"
      end
    end
  end
end

