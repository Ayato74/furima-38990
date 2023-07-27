require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'user_idとitem_id、post_codeとregion_id、municipalitiesとaddress_num、tel_numが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end

      it "priceとtokenがあれば保存ができること" do
        expect(@order_address).to be_valid
      end

      it "building_nameが空でも保存ができること" do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'post_codeが空では購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors[:post_code]).to include("can't be blank")
      end

      it 'post_codeが3桁ハイフン4桁でない場合は購入できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors[:post_code]).to include("is invalid. Include hyphen(-)")
      end

      it 'post_codeが半角文字列でない場合は購入できない' do
        @order_address.post_code = '１２３−４５６７'
        @order_address.valid?
        expect(@order_address.errors[:post_code]).to include("is invalid. Include hyphen(-)")
      end

      it 'region_idが空では購入できない' do
        @order_address.region_id = '1'
        @order_address.valid?
        expect(@order_address.errors[:region_id]).to include("can't be blank")
      end

      it 'municipalitiesが空では購入できない' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors[:municipalities]).to include("can't be blank")
      end

      it 'address_numが空では購入できない' do
        @order_address.address_num = ''
        @order_address.valid?
        expect(@order_address.errors[:address_num]).to include("can't be blank")
      end

      it 'tel_numが空では購入できない' do
        @order_address.tel_num = ''
        @order_address.valid?
        expect(@order_address.errors[:tel_num]).to include("can't be blank")
      end

      it 'tel_numが9桁以下である場合は購入できない' do
        @order_address.tel_num = '12345'
        @order_address.valid?
        expect(@order_address.errors[:tel_num]).to include("is invalid. Please enter 10 or 11 digits only")
      end

      it 'tel_numが12桁以上である場合は購入できない' do
        @order_address.tel_num = '1234567891011'
        @order_address.valid?
        expect(@order_address.errors[:tel_num]).to include("is invalid. Please enter 10 or 11 digits only")
      end

      it 'tel_numが半角数値でない場合は購入できない' do
        @order_address.tel_num = '１２３４５６７８９０'
        @order_address.valid?
        expect(@order_address.errors[:tel_num]).to include("is invalid. Please enter 10 or 11 digits only")
      end

      it 'user_idが紐づいていなければ購入できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが紐づいていなければ購入できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'トークンが空だと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
