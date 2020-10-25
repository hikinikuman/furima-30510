class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date

  belongs_to :user
  has_one :purchase

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category
    validates :condition
    validates :postage
    validates :prefecture
    validates :shipping_date
    validates :price
  end

  validates :category_id,      numericality: { other_than: 1 }
  validates :condition_id,     numericality: { other_than: 1 }
  validates :postage_id,       numericality: { other_than: 1 }
  validates :prefecture_id,    numericality: { other_than: 1 }
  validates :shipping_date_id, numericality: { other_than: 1 }

  validates :price,            numericality: { greater_than_or_equal_to: 300 }
  validates :price,            numericality: { less_than_or_equal_to: 9_999_999 }
end
