class Performance < ApplicationRecord
  has_many :customer_consumptions
  validates :date, presence: true
  validates :customer_number, presence: true
  validates :server_number, presence: true

end
