class Checklist < ApplicationRecord
  has_many :assignments
  has_many :tasks, dependent: :destroy
  has_one_attached :photo
  validates :title, presence: true
  validates :description, presence: true
end
