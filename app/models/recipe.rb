class Recipe < ApplicationRecord
  belongs_to :user
  has_many :customer_consumptions
  has_many :product_recipes, dependent: :destroy
  has_many :products, through: :product_recipes
  validates :name, presence: true
  validates :recipe_description, presence: true
  validates :price, presence: true
  validates :preparation_time, presence: true
  validates :meal_description, presence: true
  has_one_attached :photo
end
