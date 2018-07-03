class User < ApplicationRecord
  has_many :bookings
  has_many :favorites

  has_many :workspaces, through: :bookings
  has_many :workspaces, through: :favorites

  has_secure_password
  validates :first_name, :last_name, :username, :email, :password, :password_confirmation, presence: true
  validates :username, :email, uniqueness: true
end
