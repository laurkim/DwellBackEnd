class Workspace < ApplicationRecord
  # Relationships between Workspace and other Models
  has_many :bookings
  has_many :favorites

  has_many :users, through: :bookings
  has_many :users, through: :favorites
end
