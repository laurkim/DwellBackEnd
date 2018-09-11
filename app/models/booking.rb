class Booking < ApplicationRecord
  # Relationships between Bookings and other Models
  belongs_to :user
  belongs_to :workspace
end
