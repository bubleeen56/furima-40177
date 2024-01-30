require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できる場合' do

      it "条件を満たしていれば登録できる" do
        @user = FactoryBot.build(:user, first_name_kanji: 'ユーザーの姓', last_name_kanji: 'ユーザーの名')
        expect(@user).to be_valid

      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
       end

      it '@がなければ登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it '重複したメールアドレスは登録できない' do
        # existing_user = FactoryBot.create(:user, email: 'duplicate@example.com')
        # @user.email = 'duplicate@example.com'
        # @user.valid?
        # expect(@user.errors.full_messages).to include('Email has already been taken')

        existing_user = FactoryBot.create(:user, email: 'duplicate@example.com',first_name_kanji: '山田', last_name_kanji: '太郎')
        @user.email = 'duplicate@example.com'

        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include('Email has already been taken')
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
        @user.password = 'pass123'
        @user.password_confirmation = 'pass123'
        # @user = User.new(nickname: 'test', email: 'test@example.com', password: 'pass123', password_confirmation: 'pass123')
        @user.valid?
        expect(@user.errors.full_messages).to_not include('Password is invalid. Include both letters and numbers')
      end

      it '半角英字のみでは登録できないこと' do
        @user.password = 'password'
        # @user = FactoryBot.build(:user, password: 'password') # 半角英字のみのパスワード
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
  
      it '半角数字のみでは登録できないこと' do
        @user.password = '123456'
        # @user = FactoryBot.build(:user, password: '123456') # 半角数字のみのパスワード
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
  
      it '全角文字を含むパスワードでは登録できないこと' do
        @user.password = 'パスワード１２３abc'
        # @user = FactoryBot.build(:user, password: 'パスワード１２３abc') # 全角文字を含むパスワード
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end

      it '姓（全角）が空だと登録できない' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.last_name_kanji = 'ｽﾐｽ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanji is invalid. Input full-width characters')
      end

      it '名（全角）が空だと登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name_kanji = 'ｼﾞｮﾝ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji is invalid. Input full-width characters')
      end

      it '姓（カナ）が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
    
      it '姓（カナ）にカタカナ以外の文字が含まれていると登録できない' do
        @user.last_name = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width katakana characters')
      end
    
      it '名（カナ）が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
    
      it '名（カナ）にカタカナ以外の文字が含まれていると登録できない' do
        @user.first_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width katakana characters')
      end
    
      it '生年月日が空だと登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end