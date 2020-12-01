class Checklist < ApplicationRecord
  has_many :assignments
  has_many :tasks
end
