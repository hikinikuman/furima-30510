require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe '新規登録/ユーザー情報' do
      it 'ニックネームが必須であること' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが必須であること' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが必須であること' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは、数字を入力した場合に登録ができない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end

      it 'パスワードに英字のみを入力した場合に登録ができない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end

      it 'パスワードは、確認用を含めて2回入力すること' do
        @user.password = 'a12345'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
        @user.password = 'a12345'
        @user.password_confirmation = 'b12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    describe '新規登録/本人情報確認' do
      it 'ユーザー本名は、名字が必須であること' do
        @user.family_name = nil
        @user.first_name = '樹'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'ユーザー本名は、名前が必須であること' do
        @user.family_name = '中薗'
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'ユーザー本名は、名字が全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.family_name = 'nakazono'
        @user.first_name = '樹'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end

      it 'ユーザー本名は、名前が全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.family_name = '中薗'
        @user.first_name = 'tatsuki'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end

      it 'ユーザー本名のフリガナは、名字が必須であること' do
        @user.family_name_kana = nil
        @user.first_name_kana = 'タツキ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'ユーザー本名のフリガナは、名前が必須であること' do
        @user.family_name_kana = 'ナカゾノ'
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'ユーザー本名のフリガナは、名字が全角（カタカナ）での入力が必須であること' do
        @user.family_name_kana = 'nakazono'
        @user.first_name_kana = 'タツキ'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end

      it 'ユーザー本名のフリガナは、名前が全角（カタカナ）での入力が必須であること' do
        @user.family_name_kana = 'ナカゾノ'
        @user.first_name_kana = 'tatsuki'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end

      it '生年月日が必須であること' do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
