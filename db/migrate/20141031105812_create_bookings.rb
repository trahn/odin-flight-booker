class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :passengers

      t.timestamps
    end
  end
end
