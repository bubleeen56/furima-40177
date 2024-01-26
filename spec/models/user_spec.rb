require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できる場合' do
      it "すべて入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空だと登録できない' do
       @user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000')
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
       end

      it '@がなければ登録できない' do
        @user = User.new(nickname: 'test', email: 'testexample.com', password: '000000', password_confirmation: '000000')
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
       @user.password = '12345'
       @user.password_confirmation = '12345'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '英数字の組み合わせでなければ登録できない' do
        # パスワードが半角英数字の組み合わせの場合
        @user = User.new(nickname: 'test', email: 'test@example.com', password: 'pass123', password_confirmation: 'pass123')
        @user.valid?
        expect(@user.errors.full_messages).to_not include('Password is invalid. Include both letters and numbers')
      end
    end
  end
end