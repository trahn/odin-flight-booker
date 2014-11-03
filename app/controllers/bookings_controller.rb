class BookingsController < ApplicationController
  def new
  	@booking = Booking.new(request_params)
  	@flight = @booking.flight
  	@booking.pax.times { @booking.passengers.build }
  end

  def create
  	@booking = Booking.create(booking_params)
    # booking_params[:passengers_attributes].each do |index, values|
    #   @booking.passengers.create(values)
    # end
    render 'show'
    send_mails(@booking)
  end

  def show
  end

  def send_mails(booking)
    booking.passengers.each do |p|
      PassengerMailer.flight_confirmation_email(p, booking.flight).deliver
    end
  end

  private

  	def request_params
  	  params.permit(:pax, :flight_id)
  	end

  	def booking_params
  	  params.require(:booking).permit(:flight_id, :pax,
  	  	passengers_attributes: [:name, :email])
  	end
end
