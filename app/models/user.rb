class User < ApplicationRecord
  # Relationships between User and other Models
  has_many :bookings
  has_many :favorites

  has_many :workspaces, through: :bookings
  has_many :workspaces, through: :favorites

  # Validations for User model
  has_secure_password
  validates :username, :password, :password_confirmation, :email, presence: true
  validates :username, :email, uniqueness: true
end
