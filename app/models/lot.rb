class Lot < ApplicationRecord
  belongs_to :product
  belongs_to :supplier
  validates :cost, presence: true
  validates :quantity, presence: true
  validates :expiration_date, presence: true
end
