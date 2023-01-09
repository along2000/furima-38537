require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nickname、email、passwordとpassword_confirmationを英数混同6文字以上、first_nameとlast_name全角、first_name_kanaとlast_name_kana全角カナ、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'asd123'
      @user.password_confirmation = 'dfg123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが英字では登録できない' do
      @user.first_name = 'abe'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    it 'first_nameが数字では登録できない' do
      @user.first_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    it 'first_nameが半角では登録できない' do
      @user.first_name = 'ｱﾍﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameが英字では登録できない' do
      @user.last_name = 'hiroshi'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end
    it 'last_nameが数字では登録できない' do
      @user.last_name = '345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end
    it 'last_nameが半角では登録できない' do
      @user.last_name = 'ﾋﾛｼ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'first_name_kanaが英字では登録できない' do
      @user.first_name_kana = 'abe'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
    end
    it 'first_name_kanaが数字では登録できない' do
      @user.first_name_kana = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
    end
    it 'first_name_kanaが全角漢字では登録できない' do
      @user.first_name_kana = '阿部'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
    end
    it 'first_name_kanaが全角ひらがなでは登録できない' do
      @user.first_name_kana = 'あべ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
    end
    it 'first_name_kanaが半角カタカナでは登録できない' do
      @user.first_name_kana = 'ｱﾍﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'last_name_kanaが英字では登録できない' do
      @user.last_name_kana = 'hiroshi'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
    end
    it 'last_name_kanaが数字では登録できない' do
      @user.last_name_kana = '345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
    end
    it 'last_name_kanaが全角漢字では登録できない' do
      @user.last_name_kana = '浩志'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
    end
    it 'last_name_kanaが全角ひらがなでは登録できない' do
      @user.last_name_kana = 'ひろし'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
    end
    it 'last_name_kanaが半角カタカナでは登録できない' do
      @user.last_name_kana = 'ﾋﾛｼ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
