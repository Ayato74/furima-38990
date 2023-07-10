require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、family_name_kanaとfirst_name_kana、birthが存在すれば登録できる' do
        user_params = {
          nickname: 'ユーザー',
          email: 'test@example.com',
          password: 'password1',
          password_confirmation: 'password1',
          family_name: '山田',
          first_name: '太郎',
          family_name_kana: 'ヤマダ',
          first_name_kana: 'タロウ',
          birth: Date.new(1990, 1, 1)
        }
        user = User.new(user_params)
        expect(user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors[:nickname]).to include("can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'password'
        @user.password_confirmation = 'different_password'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors[:family_name]).to include("can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors[:first_name]).to include("can't be blank")
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors[:family_name_kana]).to include("can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include("can't be blank")
      end
      it 'birthが空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors[:birth]).to include("can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'invalid_email'
        @user.valid?
        expect(@user.errors[:email]).to include("is invalid")
      end
      it 'passwordが6文字以下では登録できない' do
        @user.password = '123a'
        @user.valid?
        expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end
      it 'passwordは半角英数字混合でない場合は登録できない' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors[:password]).to include("is invalid")
      end
      it 'passwordが英字のみのパスワードでは登録できない' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors[:password]).to include("is invalid")
      end
      it 'passwordが数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors[:password]).to include("is invalid")
      end
      it 'passwordが全角文字を含むパスワードでは登録できない' do
        @user.password = 'パスワード123'
        @user.valid?
        expect(@user.errors[:password]).to include("is invalid")
      end
      it 'family_nameは全角（漢字・ひらがな・カタカナ）でない場合は登録できない' do
        @user.family_name = 'Smith'
        @user.valid?
        expect(@user.errors[:family_name]).to include("is invalid")
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）でない場合は登録できない' do
        @user.first_name = 'John'
        @user.valid?
        expect(@user.errors[:first_name]).to include("is invalid")
      end
      it 'family_name_kanaは全角（カタカナ）でない場合は登録できない' do
        @user.family_name_kana = 'すみす'
        @user.valid?
        expect(@user.errors[:family_name_kana]).to include("is invalid")
      end
      it 'first_name_kanaは全角（カタカナ）でない場合は登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include("is invalid")
      end
    end
  end
end
