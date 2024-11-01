class Product < ApplicationRecord
  # has_many :product_images, dependent: :destroy
  belongs_to :category
  has_many :variants, dependent: :destroy
  enum status: { inactive: 0, active: 1 }
end
