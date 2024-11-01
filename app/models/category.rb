class Category < ApplicationRecord
  has_one_attached :category_img, dependent: :destroy
  has_many :products, dependent: :destroy
end
