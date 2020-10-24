class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date

  belongs_to :user
  has_one_attached :image

  # with_options presence: true do
  # validates :name
  # validates :description
  # validates :category_id
  # validates :condition_id
  # validates :postage_id
  # validates :prefecture_id
  # validates :shipping_date_id
  # validates :price
  # end

  with_options presence: true do
    validates :name          #format: #{ with: message: 'is invalid.' }
    validates :description   #format: #{ message: 'is invalid.' }
    validates :category      #format: #{ message: 'is invalid.' }
    validates :condition     #format: #{ message: 'is invalid.' }
    validates :postage       #format: #{ message: 'is invalid.' }
    validates :prefecture    #format: #{ message: 'is invalid.' }
    validates :shipping_date #format: #{ message: 'is invalid.' }
    validates :price,         format: { with: /\d/, message: 'is invalid.' }
  end

  validates :category_id,      numericality: { other_than: 1 }
  validates :condition_id,     numericality: { other_than: 1 }
  validates :postage_id,       numericality: { other_than: 1 }
  validates :prefecture_id,    numericality: { other_than: 1 }
  validates :shipping_date_id, numericality: { other_than: 1 }

  #validates :price,            format: { with: /\d/, message: 'is invalid.' }
end
