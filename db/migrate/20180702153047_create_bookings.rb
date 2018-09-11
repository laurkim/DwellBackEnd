class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :workspace_id
      t.integer :start_time, limit: 8
      t.integer :end_time, limit: 8

      t.timestamps
    end
  end
end
