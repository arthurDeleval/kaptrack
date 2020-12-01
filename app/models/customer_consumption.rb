class CustomerConsumption < ApplicationRecord
  belongs_to :recipe
  belongs_to :performance
  validates :quantity, presence: true
end
