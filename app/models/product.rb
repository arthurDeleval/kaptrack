class Product < ApplicationRecord
  has_many :lots
  has_many :products
end
