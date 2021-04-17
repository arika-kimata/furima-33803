require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe ' 商品出品機能 ' do
    context ' 商品が出品できるとき ' do
      it ' 全ての値が正しく入力されていれば出品できること ' do
        expect(@item).to be_valid
      end
    
    end

    context ' 商品が出品できないとき ' do
      it ' imageが体と出品できない ' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像が入力されていません。")
      end

      it ' product_nameが空だと出品できない ' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名が入力されていません。")
      end

      it ' explanationが空だと出品できない ' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明が入力されていません。")
      end

      it ' category_idが未選択だと出品できない ' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors[:category_id]).to include("が入力されていません。")
      end

      it ' status_idが未選択だと出品できない ' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors[:status_id]).to include("が入力されていません。")
      end

      it ' shipping_charges_idが未選択だと出品できない ' do
        @item.shipping_charges_id = nil
        @item.valid?
        expect(@item.errors[:shipping_charges_id]).to include("が入力されていません。")
      end

      it ' prefectures_idが未選択だと出品できない ' do
        @item.prefectures_id = nil
        @item.valid?
        expect(@item.errors[:prefectures_id]).to include("が入力されていません。")
      end

      it ' shipping_date_idが未選択だと出品できない ' do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors[:shipping_date_id]).to include("が入力されていません。")
      end

      it ' priceが空だと出品できない ' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格が入力されていません。", "販売価格は、半角数字で入力して下さい。", "販売価格は、300円から9,999,999円の間で入力して下さい。")
      end

      it ' priceが全角数字だと出品できない ' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は、半角数字で入力して下さい。")
      end

      it ' priceが半角数字以外の文字があると出品できない ' do
        @item.price = '300yen'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は、半角数字で入力して下さい。")
      end

      it 'priceが300円以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は、300円から9,999,999円の間で入力して下さい。")
      end

      it 'priceが9,999,999円以上だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は、300円から9,999,999円の間で入力して下さい。")
      end
    end
  end
end
