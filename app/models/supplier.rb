class Supplier < ApplicationRecord
  has_many :lots
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end
