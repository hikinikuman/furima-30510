class Purchase < ApplicationRecord
  # attr_accessor :token

  # validates :token, presence: true

  # 試しにクレジットカード（↑）もpurchase_addressにブチ込む

  belongs_to :user
  belongs_to :item
  has_one :address
end
