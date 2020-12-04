class Lot < ApplicationRecord
  belongs_to :product
  belongs_to :supplier
  validates :cost, presence: true
  validates :quantity, presence: true
  validates :expiration_date, presence: true
  
  # CODE POUR AJOUTER UNE SEARCH BAR SUR L'INDEX DES STOCKS
  # include PgSearch::Model
  # pg_search_scope :global_search,
  # against: [[:title, 'A' ], [:description, 'B' ], [:deadline, 'C' ]],
  # associated_against: {
  #   product: [:name]
  # },
  # associated_against: {
  #   supplier: [[:name, 'A'], [:address, 'B']]
  # },
  # using: {
  #   tsearch: { prefix: true }
  # }
  
  has_one_attached :photo
  
end
