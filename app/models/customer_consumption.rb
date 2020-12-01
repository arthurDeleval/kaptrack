class CustomerConsumption < ApplicationRecord
  belongs_to :recipe
  belongs_to :performance
end
