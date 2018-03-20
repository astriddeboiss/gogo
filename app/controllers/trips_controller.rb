class TripsController < ApplicationController
  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @test = @trip.valid?
    raise
    if @trip.save
      raise
    else
      redirect_to root_path
    end
  end

  private

  def trip_params
   params.require(:trip).permit(:city_id)
  end


end
