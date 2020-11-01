class PurchaseAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :token, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_num

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_num, format: { with: /\A0[789]0\d{8}\z/, message: 'is invalid.' }
  end

  validates :prefecture_id, numericality: { other_than: 1 }



  def save

    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_num: phone_num, purchase_id: purchase.id)
  end
end

