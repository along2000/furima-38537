require 'rails_helper'
RSpec.describe OrderRecordPayment, type: :model do
  before do
    @order_record_payment = FactoryBot.build(:order_record_payment)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_record_payment).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_record_payment.user_id = 1
        expect(@order_record_payment).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_record_payment.item_id = 1
        expect(@order_record_payment).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @order_record_payment.postcode = '123-4560'
        expect(@order_record_payment).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @order_record_payment.delivery_source_id = 2
        expect(@order_record_payment).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_record_payment.city = 'さいたま市'
        expect(@order_record_payment).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_record_payment.block = '緑区１２'
        expect(@order_record_payment).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_record_payment.building = nil
        expect(@order_record_payment).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @order_record_payment.phone_number = 12_345_678_910
        expect(@order_record_payment).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_record_payment.user_id = nil
        @order_record_payment.valid?
        expect(@order_record_payment.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_record_payment.item_id = nil
        @order_record_payment.valid?
        expect(@order_record_payment.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @order_record_payment.postcode = nil
        @order_record_payment.valid?
        expect(@order_record_payment.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_record_payment.postcode = 1_234_567
        @order_record_payment.valid?
        expect(@order_record_payment.errors.full_messages).to include('Postcode 郵便番号は「3桁ハイフン4桁」の半角文字列で入力してください')
      end
      it '都道府県が「---」だと保存できないこと' do
        @order_record_payment.delivery_source_id = 1
        @order_record_payment.valid?
        expect(@order_record_payment.errors.full_messages).to include('Delivery source 都道府県を選択してください')
      end
      it '都道府県が空だと保存できないこと' do
        @order_record_payment.delivery_source_id = nil
        @order_record_payment.valid?
        expect(@order_record_payment.errors.full_messages).to include("Delivery source can't be blank",
                                                                      'Delivery source 都道府県を選択してください')
      end
      it '市区町村が空だと保存できないこと' do
        @order_record_payment.city = nil
        @order_record_payment.valid?
        expect(@order_record_payment.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_record_payment.block = nil
        @order_record_payment.valid?
        expect(@order_record_payment.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_record_payment.phone_number = nil
        @order_record_payment.valid?
        expect(@order_record_payment.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order_record_payment.phone_number = '123 - 1234 - 1234'
        @order_record_payment.valid?
        expect(@order_record_payment.errors.full_messages).to include('Phone number 電話番号は10桁から11桁の数字のみ入力してください')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order_record_payment.phone_number = 12_345_678_910_123_111
        @order_record_payment.valid?
        expect(@order_record_payment.errors.full_messages).to include('Phone number 電話番号は10桁から11桁の数字のみ入力してください')
      end
      it 'トークンが空だと保存できないこと' do
        @order_record_payment.token = nil
        @order_record_payment.valid?
        expect(@order_record_payment.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
