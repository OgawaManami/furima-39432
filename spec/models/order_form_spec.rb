require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_form.user_id = 1
        expect(@order_form).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_form.item_id = 1
        expect(@order_form).to be_valid
      end
      it '郵便番号が「3桁ハイフン4桁」の組み合わせであれば保存できる' do
        @order_form.zip_code = '123-4560'
        expect(@order_form).to be_valid
      end
      it '都道府県が「---」以外であれば登録できる' do
        @order_form.prefecture_id = 1
        expect(@order_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_form.city = '横浜市'
        expect(@order_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_form.street = '旭区１２３'
        expect(@order_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @order_form.tel = 12_345_678_910
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @order_form.zip_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Zip code can't be blank", "Zip code is invalid")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_form.zip_code = 1_234_567
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Zip code is invalid")
      end
      it '都道府県が「---」だと保存できないこと' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '都道府県が空だと保存できないこと' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_form.street = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Street can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_form.tel = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order_form.tel = '123 - 1234 - 1234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号が半角数字でないと保存できないこと' do
        @order_form.tel = '３００'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号が半角英数混合では保存できないこと' do
        @order_form.tel = '300dollars'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号が半角英語だけでは保存できないこと' do
        @order_form.tel= 'threemillion'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel is invalid")
      end
      it 'トークンが空だと保存できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end