require 'rails_helper'

RSpec.describe 'カレンダー機能', type: :system do  
  before do
    @user = FactoryBot.create(:user)
    @payment = FactoryBot.create(:payment)
    @category = FactoryBot.create(:category)
    visit new_user_session_path
    fill_in 'user_email', with:'user1@test.com'
    fill_in 'user_password', with:'123456'
    click_on 'ログイン'
    FactoryBot.create(:trade, payment: @payment, category: @category, user: @user)
    FactoryBot.create(:second_trade, payment: @payment, category: @category, user: @user)
    FactoryBot.create(:third_trade, payment: @payment, category: @category, user: @user)
  end
  
  describe '新規作成機能' do
    context '取引明細を新規作成した場合' do
      it '作成した取引がカレンダー表示される', js: true do        
        visit trades_path
        page.first(".fc-day").click
        select "現金", from: "trade[payment_id]"
        select '食費', from: "trade[category_id]"        
        fill_in "trade_amount", with: 1000 
        click_on "保存"
        expect(page).to have_content "食費 : 1,000円"
      end
    end
  end

  describe '一覧表示機能' do
    context 'カレンダーに遷移した場合' do
      it '作成済みの取引一覧が表示される', js: true do
        visit trades_path
        expect(page).to have_content '食費 : 1,000円'
        expect(page).to have_content '食費 : 2,000円'
        expect(page).to have_content '食費 : 3,000円'
      end
    end
  end
end