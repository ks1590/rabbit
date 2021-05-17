require 'rails_helper'
RSpec.describe 'ユーザーモデル機能', type: :model do

  describe 'バリデーションのテスト' do
    
    context 'メールアドレスが不正の値だった場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.build(:user, email: "12345")
        expect(user).not_to be_valid
      end
    end

    context 'パスワードが未入力の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.build(:user, password: nil)
        expect(user).not_to be_valid
      end
    end
    
    context 'メールアドレス、パスワードがある場合' do
      it 'バリデーションが通る' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end
  end
end