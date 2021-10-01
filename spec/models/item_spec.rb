require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:user)
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
      it 'descriptionが1000文字以内であれば出品できる'
        @item.description = 'ああああああああああああ'
        expect(@item).to be_valid
    end

    context '出品できないとき' do
      it 'titleのidが1では出品できない' do
        @item.title_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it 'descriptionのidが1では出品できない' do
        @item.describe_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it 'categoryのidが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it 'statusのidが1では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it 'shipping_feeのidが1では出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
      it 'prefectureのidが1では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it 'day_to_shipのidが1では出品できない' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
    end
  end
end