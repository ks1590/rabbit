require 'rails_helper'

RSpec.describe 'カレンダー機能', type: :system do
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
end