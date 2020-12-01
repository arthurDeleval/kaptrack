class Recipe < ApplicationRecord
  belongs_to :user
  has_many :customer_consumptions
  has_many :product_recipes
end
