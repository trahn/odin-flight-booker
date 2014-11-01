class AddFlightIdToBookings < ActiveRecord::Migration
  def change
  	remove_column :bookings, :passengers
  	add_column :bookings, :pax, :integer
  	add_column :bookings, :flight_id, :integer
  end
end
