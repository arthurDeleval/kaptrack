class Planning < ApplicationRecord
  belongs_to :user
  validates :starting_shift, presence: true
  validates :ending_shift, presence: true
  validates :starting_date, presence: true
  validates :ending_date, presence: true
end
