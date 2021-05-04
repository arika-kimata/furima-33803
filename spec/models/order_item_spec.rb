require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_item = FactoryBot.build(:order_item, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe ' 商品の購入 ' do
    context ' 購入ができるとき ' do
      it ' 全ての項目が入力されていれば購入ができる ' do
        expect(@order_item).to be_valid
      end

      it ' 建物名がなくても保存できること ' do
        @order_item.building = ''
        expect(@order_item).to be_valid
      end
    end

    context ' 購入ができないとき ' do
      it ' 紐づくuserがいないと保存できない ' do
        @order_item.user_id = ''
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('Userが入力されていません。')
      end

      it ' 紐づく商品情報がないと保存できない ' do
        @order_item.item_id = ''
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('Itemが入力されていません。')
      end

      it ' token(クレジットカード情報)が空だと購入ができない ' do
        @order_item.token = nil
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('クレジットカードの情報が入力されていません。')
      end

      it ' 郵便番号が空だと購入ができない ' do
        @order_item.postcode = ''
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('郵便番号は、半角数字で入力し、半角ハイフンを含めて下さい。', '郵便番号は、ハイフンを含む８桁で入力して下さい。')
      end

      it ' 郵便番号にハイフンがないと登録できない ' do
        @order_item.postcode = '12345678'
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('郵便番号は、半角数字で入力し、半角ハイフンを含めて下さい。')
      end

      it ' 郵便番号が8桁でないと購入できない ' do
        @order_item.postcode = '123-458'
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('郵便番号は、半角数字で入力し、半角ハイフンを含めて下さい。', '郵便番号は、ハイフンを含む８桁で入力して下さい。')
      end

      it ' prefectures_idが空だと購入できない ' do
        @order_item.prefectures_id = nil
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('都道府県が未選択です。')
      end

      it ' city_nameが空だと購入できない ' do
        @order_item.municipality = ''
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('市区町村が入力されていません。')
      end

      it ' block_nameが空だと購入できない ' do
        @order_item.address = ''
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('番地が入力されていません。')
      end

      it ' phone_numberが空だと購入できない ' do
        @order_item.phone_number = ''
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('電話番号が入力されていません。','電話番号は、半角数字で入力して下さい。')
      end

      it ' phone_numberが11桁でなければ購入できない ' do
        @order_item.phone_number = '080123456789'
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('電話番号は、半角数字で入力して下さい。')
      end

      it ' 電話番号に数値以外があると保存できない ' do
        @order_item.phone_number = '090-1234-5678'
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('電話番号は、半角数字で入力して下さい。')
      end

      it ' 電話番号に英字が混ざっても保存できない ' do
        @order_item.phone_number = 'tel09012345'
        @order_item.valid?
        expect(@order_item.errors.full_messages).to include('電話番号は、半角数字で入力して下さい。')
      end
    end
  end
end