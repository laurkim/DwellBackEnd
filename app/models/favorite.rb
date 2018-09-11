class Favorite < ApplicationRecord
  # Relationships between Favorites and other Models
  belongs_to :user
  belongs_to :workspace
end
