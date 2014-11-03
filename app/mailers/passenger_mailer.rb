class PassengerMailer < ActionMailer::Base
  default from: "your-booking@odin-flight-booker.com"

  def flight_confirmation_email(passenger, flight)
  	@passenger = passenger
  	@flight = flight
  	mail(to: @passenger.email, subject: "Your flight booking on flight #{@flight.id}")
  end
end
