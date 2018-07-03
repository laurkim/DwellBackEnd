class BookingSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user
  belongs_to :workspace
end