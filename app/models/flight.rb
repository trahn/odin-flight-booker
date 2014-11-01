class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: 'Airport',
							foreign_key: 'start_id'
  belongs_to :to_airport, 	class_name: 'Airport',
  							foreign_key: 'finish_id'
  has_many :bookings
  has_many :passengers, through: :bookings
  
  default_scope includes(:from_airport, :to_airport)
end
