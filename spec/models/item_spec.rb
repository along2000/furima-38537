require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

   describe '商品出品機能' do
    context '商品が出品できる場合' do
     it '商品画像、商品名、商品説明、カテゴリ、商品の状態、配送料負担、発送元、発送日数、価格が入力されていれば出品できる' do
      expect(@item).to be_valid
     end
    end

    context '商品が出品できない場合' do
     it 'ユーザーが紐ついていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
     end
     it '画像が空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
     end
     it '商品名が空だと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
     end
     it '商品説明が空だと出品できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
     end
     it 'カテゴリーが未選択だと出品できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
     end
     it '配送料が未選択だと出品できない' do
      @item.delivery_charge_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
     end
     it '発送元が未選択だと出品できない' do
      @item.delivery_source_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery source can't be blank")
     end
     it '発送日数が未選択だと出品できない' do
      @item.delivery_date_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")
     end
     it '価格が空だと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
     end
     it '価格が300未満だと出品できない' do
      @item.price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 300から999999までの数字で入力してください")
     end
     it '価格が9,999,999を超えていると出品できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 300から999999までの数字で入力してください")
     end
     it '価格が全角だと出品できない' do
      @item.price = '二千円'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 300から999999までの数字で入力してください")
     end
    end
   end
end
