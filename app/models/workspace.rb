class Workspace < ApplicationRecord
  has_many :bookings
  has_many :favorites

  has_many :users, through: :bookings
  has_many :users, through: :favorites
end
