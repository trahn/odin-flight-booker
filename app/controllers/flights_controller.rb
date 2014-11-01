class FlightsController < ApplicationController

  def index
  	@codes = Airport.select(:code, :id).uniq.map { |a| [ a.code, a.id ] }
  	@no_pax = (1..4).to_a.map { |n| [n,n] }
  	@dates = Flight.pluck(:takeoff).map(&:to_date).uniq.sort
  	@pax = params[:no_pax].to_i || 1
  	@flight = Flight.new(search_params, takeoff: search_params[:takeoff].to_datetime) if params[:flight]
  	if @flight.nil?
	  @flight = Flight.new(takeoff: @dates.first.to_datetime)
	else
	  @flights = Flight.where("start_id = ? and finish_id = ? and takeoff >= ? and takeoff < ?", 
	  				@flight.start_id, @flight.finish_id, @flight.takeoff, @flight.takeoff + 1.day).
	  				order("takeoff")
	  @booking = Booking.new
	end
  end

  private

  def search_params
  	params.require(:flight).permit(:start_id, :finish_id, :takeoff, :no_pax)
  end
  

end
