class Message < ApplicationRecord
  has_many :messages
  validates :content, presence: true

end
