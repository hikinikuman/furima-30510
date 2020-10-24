require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include
    end

    it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it '商品の状態についての情報が必須であること' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it '配送料の負担についての情報が必須であること' do
      @item.postage_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage must be other than 1")
    end

    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it '発送までの日数についての情報が必須であること' do
      @item.shipping_date_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
    end

    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が、¥300以下は選択できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include
    end

    it '価格の範囲が、¥9,999,999以上は選択できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include
    end

    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '２２２'
      @item.valid?
      expect(@item.errors.full_messages).to include
    end
  end
end
