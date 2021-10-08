require 'rails_helper'

RSpec.describe Form, type: :model do
  describe '商品購入に必要なデータの保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @form = FactoryBot.build(:form, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '保存できる場合' do
      it 'shipping_addressとtokenがあれば保存できること' do
        expect(@form).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @form.building_name = ''
        expect(@form).to be_valid
      end
    end

    context '保存できない場合' do
      it 'postal_codeが空では保存できない' do
        @form.postal_code = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが全角数値では保存できない' do
        @form.postal_code = '１２３−４５６７'
        @form.valid?
        expect(@form.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeにハイフンが含まれていなければ登録できない' do
        @form.postal_code = 1_234_567
        @form.valid?
        expect(@form.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが1では保存できない' do
        @form.prefecture_id = 1
        @form.valid?
        expect(@form.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'municipalityが空では保存できない' do
        @form.municipality = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では保存できない' do
        @form.address = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_nuが空では保存できない' do
        @form.phone_nu = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone nu can't be blank")
      end
      it 'phone_nuが10桁以下だと保存できない' do
        @form.phone_nu = 10_000
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone nu is invalid')
      end
      it 'phone_nuが11桁以上だと保存できない' do
        @form.phone_nu = 100_000_000_000
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone nu is invalid')
      end
      it 'phone_nuが全角数値だと保存できない' do
        @form.phone_nu = '１００００００００００'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone nu is invalid')
      end
      it 'phone_nuが英数字混合では保存できない' do
        @form.phone_nu = '1a1a1a1a1a'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone nu is invalid')
      end
      it 'userが紐づいていないと保存できない' do
        @form.user_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できない' do
        @form.item_id = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では保存できない' do
        @form.token = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
