class BookingSerializer < ActiveModel::Serializer
  attributes :id, :workspace, :start_time, :end_time
  belongs_to :user
  belongs_to :workspace
end
