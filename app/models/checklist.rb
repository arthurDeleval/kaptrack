class Checklist < ApplicationRecord
  has_many :assignments
  has_many :tasks
  validates :title, presence: true
  validates :description, presence: true
end
