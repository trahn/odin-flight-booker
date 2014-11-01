# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Airports
codes = ["SFO", "NYC", "FRA", "CNX", "BKK", "SIN", "ZHR"]
codes.each do |code|
  Airport.create(code: code)
end

#Flights
10000.times do
  Flight.create(	start_id: rand(codes.count)+1,
  					finish_id: rand(codes.count)+1,
  					takeoff: Time.new(2014,11,rand(30)+1,rand(24),rand(60)),
  					duration: "#{rand(24)}:#{rand(60)}:00")
end