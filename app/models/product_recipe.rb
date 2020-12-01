class ProductRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :product
  validates :recipe_quantity, presence: true

end
