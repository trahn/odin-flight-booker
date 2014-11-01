class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :start_id, index: true
      t.integer :finish_id, index:true
      t.datetime :takeoff, index: true
      t.time :duration

      t.timestamps
    end

    add_index :flights, [:start_id, :finish_id]
  end
end
