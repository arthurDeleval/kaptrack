class Product < ApplicationRecord
  has_many :lots
  has_many :product_recipes
  has_many :suppliers, through: :lots
  validates :name, presence: true
  validates :measure_unit, presence: true
end
