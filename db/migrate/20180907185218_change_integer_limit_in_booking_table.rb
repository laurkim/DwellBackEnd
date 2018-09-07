class ChangeIntegerLimitInBookingTable < ActiveRecord::Migration[5.1]
  def change
    change_column :bookings, :start_time, :integer, limit: 8
    change_column :bookings, :end_time, :integer, limit: 8
  end
end
