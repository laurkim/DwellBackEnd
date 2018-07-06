class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :workspace_id
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end
end
