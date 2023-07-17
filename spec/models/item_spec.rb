require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
      it 'imageとtitle、explanationとcategory_id、condition_idとdelivery_charge_id、region_idとnum_of_day_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end

      it 'titleが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors[:title]).to include("can't be blank")
      end

      it 'explanationが空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors[:explanation]).to include("can't be blank")
      end

      it 'category_idが空では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors[:category_id]).to include("can't be blank")
      end

      it 'condition_idが空では出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors[:condition_id]).to include("can't be blank")
      end

      it 'delivery_charge_idが空では出品できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors[:delivery_charge_id]).to include("can't be blank")
      end

      it 'region_idが空では出品できない' do
        @item.region_id = '1'
        @item.valid?
        expect(@item.errors[:region_id]).to include("can't be blank")
      end

      it 'num_of_day_idが空では出品できない' do
        @item.num_of_day_id = '1'
        @item.valid?
        expect(@item.errors[:num_of_day_id]).to include("can't be blank")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors[:price]).to include("is not a number")
      end

      it 'priceが300円以下の場合は出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors[:price]).to include("must be greater than or equal to 300")
      end

      it 'priceが9999999円以上の場合は出品できない' do
        @item.price = '99999999'
        @item.valid?
        expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
      end

      it 'priceが半角数値以外の場合は出品できない' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors[:price]).to include("is not a number")
      end
      it 'userが紐づいていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors[:user]).to include("must exist")
      end
    end
  end
end
