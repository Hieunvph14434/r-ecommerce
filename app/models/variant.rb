class Variant < ApplicationRecord
  belongs_to :product
  has_many :variant_attributes, dependent: :destroy
end
