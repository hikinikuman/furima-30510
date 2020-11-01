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

  #- 郵便番号にはハイフンが必要であること（123-4567となる）
  #- 電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）

  def save
    # purchase = Purchase.create(token: token)
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_num: phone_num, purchase_id: purchase.id)
  end
end

# class PurchaseAddress
# include ActiveModel::Model

# attr_accessor :token, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_num

# with_options presence: true do
# validates :token
# validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
# validates :prefecture_id
# validates :municipality
# validates :address
# validates :building_name
# validates :phone_num, format: {with: /\A0[789]0\d{8}\z/, message: "is invalid."}
# end

# validates :prefecture_id,    numericality: { other_than: 1 }

#- 郵便番号にはハイフンが必要であること（123-4567となる）
#- 電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）

# def save

# purchase = Purchase.create(token: token)
# purchase = Purchase.create(user_id: user.id, item_id: item.id)

# Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_num: phone_num, purchase_id: purchase.id)

# end
# end
