require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
      context '新規登録ができる時' do
        it 'nickname,email,password,password_confirmation, age,purpose_body_id,day_training_time_id' do
          expect(@user).to be_valid
        end
    end

    context '新規登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'aaaa.aa.aa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'q1111'
        @user.password_confirmation = 'q1111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '1111111'
        @user.password_confirmation = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it 'passwordが半角英字のみだと登録できない' do
        @user.password = 'pppppppp'
        @user.password_confirmation = 'pppppppp'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end
      it 'passwordが全角の場合登録できない' do
        @user.password = 'ああああああああ'
        @user.password_confirmation = 'ああああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
      end

      it 'ageが空では登録できない' do
        @user.age = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Age can't be blank"
      end

      it 'ageが数字以外では登録できない' do
        @user.age = 'aaa'
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include "Age can't be blank"
      end

      it 'purpose_body_idが数字以外では登録できない' do
        @user.purpose_body_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include " can't be blank", "Prefecture can't be blank"
      end
      
      it 'purpose_body_idが1だと登録できない' do
        @user.purpose_body_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include " can't be blank"
      end

      it 'day_training_time_idが1だと登録できない' do
        @user.day_training_time_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Prefecture can't be blank"
      end

      it 'day_training_time_idが1だと登録できない' do
        @user.day_training_time_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include "Prefecture can't be blank"
      end
    end
  end
end
