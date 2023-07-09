require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
    end
    it 'emailが空では登録できない' do
    end
    it 'passwordが空では登録できない' do
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
    end
    it 'family_nameが空では登録できない' do
    end
    it 'first_nameが空では登録できない' do
    end
    it 'family_name_kanaが空では登録できない' do
    end
    it 'first_name_kanaが空では登録できない' do
    end
    it 'birthが空では登録できない' do
    end
    it '重複したemailが存在する場合は登録できない' do
    end
    it 'emailは@を含まないと登録できない' do
    end
    it 'passwordが6文字以下では登録できない' do
    end
    it 'passwordは半角英数字混合でない場合は登録できない' do
    end
    it 'family_nameは全角（漢字・ひらがな・カタカナ）でない場合は登録できない' do
    end
    it 'first_nameは全角（漢字・ひらがな・カタカナ）でない場合は登録できない' do
    end
    it 'family_name_kanaは全角（カタカナ）でない場合は登録できない' do
    end
    it 'first_name_kanaは全角（カタカナ）でない場合は登録できない' do
    end
  end
end