class Chatroom < ApplicationRecord
  belongs_to :message
  belongs_to :user
  validates :message_date, presence: true
end
