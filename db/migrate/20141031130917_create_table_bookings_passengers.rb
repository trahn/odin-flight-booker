class CreateTableBookingsPassengers < ActiveRecord::Migration
  def change
    create_table :bookings_passengers do |t|
    	t.integer :booking_id, index: true
    	t.integer :passenger_id, index: true

    	t.timestamp
    end
  end
end
