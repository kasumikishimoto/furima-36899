require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品ができるとき' do
      it 'titleとdescription, category, status, shipping_fee, prefecture, day_to_ship, price が存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'titleが40文字以内であれば出品できる' do
        @item.title = 'あいうえお'
        expect(@item).to be_valid
      end
      it 'descriptionが1000文字以内であれば出品できる' do
        @item.description = 'ああああああああああああ'
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
      it 'titleのidが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("タイトルを入力してください")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は不正な値です")
      end
      it 'priceが全角では保存できない' do
        @item.price = '２００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は一覧にありません")
      end
      it 'priceが英字では保存できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は一覧にありません")
      end
      it 'priceが英数字混合では保存できない' do
        @item.price = '1a1a1a'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は一覧にありません")
      end
      it '300未満の値では保存できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は一覧にありません")
      end
      it '10000000以上の値では保存できない' do
        @item.price = 1_000_000_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は一覧にありません")
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'categoryのidが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it 'statusのidが1では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end
      it 'shipping_feeのidが1では出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料は1以外の値にしてください")
      end
      it 'prefectureのidが1では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域は1以外の値にしてください")
      end
      it 'day_to_shipのidが1では出品できない' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数は1以外の値にしてください")
      end
    end
  end
end
