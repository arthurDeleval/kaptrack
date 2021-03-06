class Recipe < ApplicationRecord
  belongs_to :user
  has_many :customer_consumptions, dependent: :destroy
  has_many :product_recipes, dependent: :destroy
  has_many :products, through: :product_recipes
  validates :name, presence: true, uniqueness: true
  validates :recipe_description, presence: true
  validates :price, presence: true
  validates :preparation_time, presence: true
  validates :meal_description, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [[:name, 'A' ], [:meal_description, 'B' ], [:recipe_description, 'C' ], [:menu_visible, 'C' ]],
  using: {
    tsearch: { prefix: true }
  }

  has_one_attached :photo

  SPECIFICITIES = ["Spicy", "Very spicy", "Very very spicy", "Fat", "Lacto-ovo", "Vegan", "Sweet"]
end
