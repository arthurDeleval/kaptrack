class User < ApplicationRecord
  has_many :assignments
  has_many :chatrooms
  has_many :plannings
  has_many :recipes, dependent: :destroy
  validates :email, presence: true
  # validates :phone_number, presence: true
  # validates :role, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
