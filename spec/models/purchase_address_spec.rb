require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '#create' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end

    it 'post_codeが空では保存できないこと' do
      @purchase_address.post_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.post_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it 'prefectureを選択していないと保存できないこと' do
      @purchase_address.prefecture_id = '1'       
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'municipalityが空では保存できないこと' do
      @purchase_address.municipality = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include
    end

    it 'addressが空では保存できないこと' do
      @purchase_address.address = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include
    end

    it 'building_nameが空でも保存できること' do
      @purchase_address.building_name = nil
      expect(@purchase_address).to be_valid
    end

    it "phone_numが空では登録できないこと" do
      @purchase_address.phone_num = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include
    end

    it "phone_numにハイフンがあると登録ができないこと" do
      @purchase_address.phone_num = "090-1234-5678"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include
    end

    it "phone_numが11文字以上だと登録ができないこと" do
      @purchase_address.phone_num = "090123456789"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include
    end
    
    it "tokenが空では登録できないこと" do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end

  end
end


