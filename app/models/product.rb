class Product < ApplicationRecord
  has_many :lots
  has_many :products
  validates :name, presence: true
end
