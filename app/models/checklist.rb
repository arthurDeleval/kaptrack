class Checklist < ApplicationRecord
  has_many :assignments
  has_many :tasks, dependent: :destroy
  has_one_attached :photo
  validates :title, presence: true
  validates :description, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [[:title, 'A' ], [:description, 'B' ], [:deadline, 'C' ]],
  using: {
    tsearch: { prefix: true }
  }
end
