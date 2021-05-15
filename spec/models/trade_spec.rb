require 'rails_helper'

RSpec.describe 'タスクモデル機能', type: :model do
  let!(:payment) { FactoryBot.create(:payment) }
  let!(:category) { FactoryBot.create(:category) }
  describe 'バリデーションのテスト' do
    context '取引明細の日付が空の場合' do
      it 'バリデーションにひっかる' do
        trade = Trade.new(event_on: '', payment_id: 1, category_id: 1, amount: '1000', memo: 'ランチ')
        expect(trade).not_to be_valid
      end
    end
    
    context '取引明細の支払方法が空の場合' do
      it 'バリデーションにひっかかる' do
        trade = Trade.new(event_on: '002021/05/31', payment_id: "", category_id: 1, amount: '', memo: 'ランチ')
        expect(trade).not_to be_valid
      end
    end
    
    context '取引明細のカテゴリーが空の場合' do
      it 'バリデーションにひっかかる' do
        trade = Trade.new(event_on: '002021/05/31', payment_id: 1, category_id: "", amount: '', memo: '')
        expect(trade).not_to be_valid
      end
    end
    
    context '取引明細の金額が空の場合' do
      it 'バリデーションにひっかかる' do
        trade = Trade.new(event_on: '002021/05/31', payment_id: 1, category_id: 1, amount: '', memo: '')
        expect(trade).not_to be_valid
      end
    end

    context '取引明細にメモ以外すべて入力されている場合' do
      it 'バリデーションが通る' do        
        trade = FactoryBot.build(:trade,                                  
                                  event_on: '002021/05/31',
                                  payment_id: payment.id,
                                  category_id: category.id,
                                  amount: '1000',
                                  memo: '')
        expect(trade).to be_valid
      end
    end
  end
end